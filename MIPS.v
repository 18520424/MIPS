module MIPS( Clk ,RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg, ReadData1, ReadData2, ALUControl, REGOut, ALUOut, Input,Res, Branch, MemContro, MemOut, PCin);
	input Clk, Res;
	output [2:0] ALUControl;
	output[31:0]  ReadData1, ReadData2, REGOut, ALUOut, Input,MemOut,PCin;
	output RegDst,RegWrite, ALUSrc, MemToReg , MemWrite, MemRead,Branch, MemContro;

	DataPath data(Res ,RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg , ALUControl ,Branch , Clk, ReadData1, ReadData2, REGOut, ALUOut, Input, MemContro,MemOut,PCin);
	ControlUnit controller(Input, RegDst, MemRead, MemWrite, MemToReg, ALUControl, ALUSrc, RegWrite, Branch);
	
endmodule 
