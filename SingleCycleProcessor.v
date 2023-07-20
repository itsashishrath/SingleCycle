module SingleCycleProcessor(
	input [31:0] Instr
	);
	
wire pc_out;
	
PC pc_obj(.pc_in(pc_in), .pc_out(pc_out));

wire [31:0]	instr;
wire [5:0] RD1;
wire zeroFlag;
wire [31:0] Aluresult;
wire [31:0] DataMemout

parameter add=3'b010;

InstrMem InstrMem_obj( .A(pc_out), .RD(instr) );

regFile regFile (.clk(clk), .A1(instr[25:21]), .A2(), .RD1(RD1), .WD3(DataMemout));

AluControl alu (.SrcA(RD1), SrcB(SignExtend), .AluController(add), .Aluresult(Aluresult), .zeroFlag(zeroFlag));

DataMem dm (.A(Aluresult), .RD(DataMemout) );
	
reg [31:0]SignExtend;

SignExtend[15:0]=instr[15:0];
SignExtend[31:16]=Instr[15]; //ye dekhna h kaise hota hai sare bits me 15 index wala store krna


