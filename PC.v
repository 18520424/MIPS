module PC(In ,Re ,PC, Clk);
	input Re, Clk;
	input[31:0] In;
	output reg [31:0] PC;
	
	always@(posedge Clk)begin
		if(Re) PC = 32'd0;
		else PC = In; 
	end
endmodule
