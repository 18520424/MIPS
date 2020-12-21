	module ControlUnit(Inst, RegDst, MemRead, MemWrite, MemToReg, ALUControl, ALUSrc, RegWrite, Branch);
		input [31:0] Inst;
		output reg MemToReg;
		output reg  MemWrite;
		output reg  MemRead;
		output reg  ALUSrc;
		output reg  RegDst;
		output reg  RegWrite;
		output reg	Branch;
		output reg  [2:0] ALUControl;         
               
reg [6:0] control;

always @(Inst[31:26],Inst[5:0]) begin 
		

    case (Inst[31:26]) 
        6'b000000: begin                          // R-type
                    control <= 7'b0000110;        

                    case (Inst[5:0])
                    6'b100000: ALUControl <= 3'b101;    // ADD
                    6'b100010: ALUControl <= 3'b110;    // SUB
                    6'b100100: ALUControl <= 3'b001;    // AND
                    6'b100101: ALUControl <= 3'b011;    // OR
                    6'b100110: ALUControl <= 3'b010;    // XOR
                endcase

            end

        6'b100011: begin                          // LW
                        control <= 7'b1101010;     
                        ALUControl <= 3'b101;
                    end

        6'b101011: begin                          // SW
                         control <= 7'b1011000;      
                         ALUControl <= 3'b101;
                    end 
						  
        6'b001000: begin                          // ADDI
                        control <= 7'b1000010; 
                        ALUControl <= 3'b101; 
                    end 
		  6'b000100: begin 
								control <= 7'b1000101;
								ALUControl <= 3'b110;
						end									//BEQ
        default:   control <= 7'bxxxxxxx;     		  // NOP
    endcase
   
    {RegDst,MemRead,MemWrite,MemToReg,ALUSrc,RegWrite, Branch} = control;
	 
end

endmodule 