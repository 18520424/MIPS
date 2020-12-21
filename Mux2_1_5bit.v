module Mux2_1_5bit(Out, In1, In2, S);
	input [4:0] In1, In2;
	input S;
	output [4:0] Out;
	
	reg [4:0] temp;
	
	always @ (*)
	begin
		if (S)
			temp <= In1;
		else temp <= In2;
	end
	
	assign Out = temp;
endmodule