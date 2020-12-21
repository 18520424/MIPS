module Mux2_1_32bit(O, In1, In2, S);
	input [31:0] In1, In2;
	input S;
	output [31:0] O;
	
	reg [31:0] temp;
	
	always @ (*)
	begin
		if (S)
			temp <= In1;
		else temp <= In2;
	end
	
	assign O = temp;
endmodule