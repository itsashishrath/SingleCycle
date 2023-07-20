module AluControl(
	input [2:0] AluController,
	input [31:0] SrcA,
	input [31:0] SrcB,
	output [31:0] Aluresult,
	output zeroFlag)
	
	reg [31:0] result;
	reg [31:0] Src_A;
	reg [31:0] Src_B;

	case(AluController)
		add: begin
				result=Src_A+Src_B;
			end
			
		sub: begin
				result=Src_A-Src_B;
			end
			
			
	endcase 
	
assign Aluresult=result;
assign ZeroFlag=(result==1'b0)?1'b1:1'b0;
	
