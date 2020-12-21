module IMEM(Instruction, Addr);
	input[31:0] Addr;
	output reg [31:0] Instruction;
	
	reg [31:0] rom[31:0];
	
	initial begin
		$readmemb("binary.txt", rom);
	end

	always @(Addr) begin
		Instruction = rom[Addr/4];
	end

endmodule
