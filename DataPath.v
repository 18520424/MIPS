module DataPath(Res,RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg , ALUControl, Branch , Clk, ReadData1, ReadData2, REGOut, ALUOut, O_In, MemControl, MemOut, PCincre);
	input Clk, RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,Res ,Branch;
	input [2:0] ALUControl;
	output[31:0] ReadData1, ReadData2, REGOut, ALUOut,O_In,MemOut, PCincre;
	output MemControl;
	wire ZeroALU,SelectPC;
	wire [4:0] REGAddr;
	wire [31:0] RegO1, RegO2, SignO, MuxOALU, ALUO, MemO, MuxOMem, AddrPC ,PC4 , OutShift, OutAddPC,nextPC , PCC, Input;
	wire [2:0] ALUControl;
	
	
	IMEM im(Input,PCC);	
	AddPC add1(.In(PCC), .Out(PC4));
	Shift2 shileft2(.In(SignO) , .Shift(OutShift));
	Add32bit add2(.In1(PC4), .In2(OutShift), .Out(OutAddPC));
	and a1(SelectPC, ZeroALU, Branch);
	Mux2_1_32bit muxPC(.O(nextPC), .In1(OutAddPC), .In2(PC4), .S(SelectPC));
	PC pc1(.In(nextPC) ,.Re(Res),.PC(PCC), .Clk(Clk));
	
	Mux2_1_5bit mux1(.Out(REGAddr), .In1(Input[20:16]), .In2(Input[15:11]), .S(RegDst));
	RegFile REGF(.Clk(Clk), .RegWrite(RegWrite), .WR(REGAddr), .WD(MuxOMem), .RR1(Input[25:21]), .RD1(RegO1), .RR2(Input[20:16]), .RD2(RegO2));
	SignEx sign(.Out(SignO), .In(Input[15:0]));
	Mux2_1_32bit mux2(.O(MuxOALU), .In1(RegO2), .In2(SignO), .S(ALUSrc));
	ALU alu(.O(ALUO), .In1(RegO1), .In2(MuxOALU), .ALUControl(ALUControl),.Zero(ZeroALU));
	DMem mem(.clk(~Clk), .MemWrite(MemWrite), .MemRead(MemRead), .Addr(ALUO), .WD(RegO2), .RD(MemO));
	Mux2_1_32bit mux3(.O(MuxOMem), .In1(MemO), .In2(ALUO), .S(MemToReg));
	
	assign ReadData1 = RegO1;
	assign ReadData2 = RegO2;
	assign REGOut = MuxOMem;
	assign ALUOut = ALUO;
	assign O_In = Input;
	assign MemControl = MemToReg;
	assign MemOut = MemO;
	assign PCincre = PCC;
endmodule
