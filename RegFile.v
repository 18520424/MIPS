module RegFile(Clk, RegWrite, WR, WD, RR1, RD1, RR2, RD2);
	input Clk,  RegWrite;
	input [4:0] WR;
	input [31:0] WD;
	input [4:0] RR1;
	output [31:0] RD1;
	input [4:0] RR2;
	output [31:0] RD2;
	reg [31:0] file [31:0];

	assign RD1 = file[RR1];
	assign RD2 = file[RR2];

	always @(posedge Clk) 
	begin
		if (RegWrite) 
			file[WR] <= WD;
	end
endmodule