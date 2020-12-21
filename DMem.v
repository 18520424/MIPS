module DMem(clk, MemWrite, MemRead, Addr, WD, RD);
	input clk, MemWrite, MemRead;
	input [31:0] Addr;
	input [31:0] WD;
	output [31:0] RD;
	
	reg [31:0] mem [31:0];
	reg [4:0] temp;
	reg [31:0] O;
	
	always @(posedge clk) 
	begin
		temp[4:0] = Addr[4:0];
		if (MemWrite) 
			mem[temp] <= WD;
		if (MemRead) 
			O <= mem[temp];
	end
	
	assign RD = O;
endmodule