module SingleCycleProcessor(
	input clk,
	input rst
	);
	
wire ALUSrc, ResultSrc;

wire [31:0]	Instr;
wire [31:0] RD1;
wire zeroFlagg;
wire zeroFlagPC;
wire [31:0] AluResult;
wire [31:0] DataMemout, ResultDataMemToReg;
wire [31:0] PC4;
wire [1:0] ImmSrc;
wire regWrite,MemWrite;
wire [31:0]RD2;
wire [31:0]SExtend;
wire [31:0] AluSrcB, pc_out ;
wire [2:0] AluControSignal;


PC pc_obj(.clk(clk), .rst(rst), .pc_in(PC4), .pc_out(pc_out));

Pcadder pc_add (.A(pc_out), .B(32'd4), .C(PC4));

InstrMem InstrMem_obj( .rst(rst),.A(pc_out), .RD(Instr) );

regFile rF (.clk(clk), .rst(rst), .A1(Instr[19:15]), .A2(Instr[24:20]), 
				.RD2(RD2),  .WE3(regWrite), .A3(Instr[11:7]), .RD1(RD1), 
				.WD3(ResultDataMemToReg));
				

AluControl aluA (.A(RD1), .B(AluSrcB), .ALUControl(AluControSignal),
					  .Result(AluResult), .Zero(zeroFlag) );

Control_unit Control_Unit_Top(
                            .Op(Instr[6:0]),
                            .RegWrite(regWrite),
                            .ImmSrc(ImmSrc),
                            .ALUSrc(ALUSrc),
                            .MemWrite(MemWrite),
                            .ResultSrc(ResultSrc),
                            .Branch(),
                            .funct3(Instr[14:12]),
                            .funct7(Instr[6:0]),
                            .ALUControl(AluControSignal)
    );

DataMem dm (.clk(clk), .rst(rst), .A(AluResult), .RD(DataMemout), 
				.WE(MemWrite), .WD(RD2)   );


Mux reg_to_alu(.A(RD2), .B(SExtend), .sel(ALUSrc), .C(AluSrcB) );

SignExtend se (.In(Instr), .ImmSrc(ImmSrc[0]), .Extend(SExtend));

Mux DataMem_to_Reg (.A(AluResult), .B(DataMemout), .sel(ResultSrc), .C(ResultDataMemToReg) );



endmodule
