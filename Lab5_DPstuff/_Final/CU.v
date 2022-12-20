module CU (in, beq, blt, regWEN, aluOp, immSel, bSel, aSel, memRW, regSel, pcSel, brUn, clk);

input [31:0] in;
input beq, blt, clk;

output reg regWEN, immSel, bSel, aSel, memRW, regSel, pcSel, brUn;
output reg [3:0] aluOp;


integer count = 0;


	always @(posedge clk) begin
/*	
	if (count < 5) begin
		count = count + 1;
		end
	else begin
		regWEN = 1;
		count = 0;
	end
	
	if (count==1) begin
		regWEN = 0;
	end	
*/
		
	//Changes regWEN every 3 and 5 cycles
	if (count<5) begin

		count = count + 1;
		
		if (count < 2) regWEN = 0;
		
		if (count == 2) regWEN = 0;
		
		if (count == 4) regWEN = 1;
		end
		
	
	else begin
	
		 count = 0;
		end

		//Non-Memory instructions 
		
			case (in[6:0])
		
			//R-type
			7'b0110011 : begin
			
							bSel = 0;
							aSel = 0;
							regSel = 1;
							pcSel = 0;
							
						//	regWEN = 0; // -> 1 MAKE SURE TO SWITCH TO 1 EVERY 5 CLOCK CYCLES
							
							
							
							//Do not care
							immSel = 0;
							memRW = 0;
							brUn = 0;
											//ALUOP: R-Type
											case(in[14:12])
											//ADD/SUB
												3'b000: begin
												
															if(in[30] == 1) aluOp = 0100;
													
															else aluOp = 0101;
															end 
											//XOR
												3'b100 : aluOp = 0001;
											//OR
												3'b110 : aluOp = 0011;
											//AND
												3'b111 : aluOp = 0010;
											endcase
											
												
												
							
							end
			//I-type
			7'b0010011 : begin
			
							immSel = 1; //First bit of Imm Value
							bSel = 1;
							aSel = 0;
							regSel = 1;
							pcSel = 0;
							
						//	regWE = 0; // -> 1
							
							//Do not care
							brUn = 0;
							memRW = 0;
											//ALUOP: I-Type
											case(in[14:12])
											//ADD/SUB
												3'b000: begin
												
															if(in[30] == 1) aluOp = 0100;
													
															else aluOp = 0101;
															end 
											//XOR
												3'b100 : aluOp = 0001;
											//OR
												3'b110 : aluOp = 0011;
											//AND
												3'b111 : aluOp = 0010;
											endcase
							
							end
			//B-type
			7'b1100011 : begin //Work on !!!!!
							
							aluOp = 0101;
							immSel = 1;
							bSel = 1;
							aSel = 1;
							
						//	regWEN = 0; //-> 1
							
							//Do not care
							memRW = 0;
							regSel = 0;
							
							
								case(in[14:12]) //Dependent Outputs
								
								//BEQ
								3'b000 : begin
								
											brUn = 0;
								
											if (beq == 1) pcSel = 1;

											else pcSel = 0;
											end
								//BNE
								3'b001 : begin
								
											brUn = 0;
								
											if (beq == 0) pcSel = 1;

											else pcSel = 0;
											end
								//BLT
								3'b100 : begin 
								
											brUn = 0;
								
											if (blt == 1) pcSel = 1;
											
											else pcSel = 0;
											end
								//BGE			
								3'b101 : begin 
								
												brUn = 0;
								
												if ((blt == 0) | (beq==1)) pcSel = 1;
											
												else pcSel = 0;
							
											
											
											
											end
								//BLTU
								3'b110 : begin
											 
												brUn = 1;
											
												if (blt == 1) pcSel = 1;
											
												else pcSel = 0;
												
											end
								//BGEU
								3'b111 : begin
											
											brUn = 1;
											
											if ((blt == 0) | (beq==1)) pcSel = 1;
											
											else pcSel = 0;
											end
								
								endcase
						
							end
			//Store Word				
			7'b0100011 : begin
			
							aluOp = 0101;
							immSel = 1;
							bSel = 1;
							aSel = 0;
							memRW = 1;
							pcSel = 0;
							
						//	regWE = 0; // -> x
							
							//Do not care
							brUn = 0;
							regSel = 0;
							
							end
			//Load Word
			7'b0000011 : begin
			
							aluOp = 0101;
							immSel = 1;
							bSel = 1;
							aSel = 0;
							memRW = 0;
							regSel = 0;
							pcSel = 0;
							
							//regWE = 0; //-> 1
							
							//Do not care 
							brUn = 0;
							
							end 
							
							
							
			
			default	  : begin
						   
							immSel = 0;
							bSel = 0;
							aSel = 0;
							memRW = 0;
							regSel = 0;
							pcSel = 1;
							aluOp = 0101;
							//regWE = 0;
							brUn = 0;
							end
			endcase 
			
			
			
		end
endmodule 
