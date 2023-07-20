module dataMem(
	input clk,
	input [31:0] A,
	output [31:0] RD)
	
	
reg [31:0][31:0] memory;

memory[14]=5;

reg [31:0] out;
reg [31:0] in;
	
always@(posedge clk)begin
	in=A;
	out=memory[in];
	
end 

assign RD=out;