module ALU(O, In1, In2, ALUControl, Zero);
	input [31:0] In1, In2;
	input [2:0] ALUControl;
	output reg[31:0] O;
	output  Zero;
	
	always @ (*) 
	begin
		case (ALUControl)
			3'b000: O = In1;
			3'b001: O = In1 & In2;
			3'b010: O = In1 ^ In2;
			3'b011: O = In1 | In2;
			3'b100: O = In1 - 32'b1;
			3'b101: O = In1 + In2;
			3'b110: O = In1 - In2;
			3'b111: O = In1 + 32'b1;
		endcase
	end
	
assign Zero = ~(|O);
endmodule 