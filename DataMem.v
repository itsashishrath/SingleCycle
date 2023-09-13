module DataMem(
	input clk,
	input rst,
	input [31:0] A,
	input WE,
	input [31:0]WD,
	output [31:0] RD);
	
	
reg [31:0] memory [1023:0];

reg [31:0] out;
reg [31:0] in;
	
always@(posedge clk)begin
	if (WE) begin
		begin
			memory[A]<=WD;
		end
	end
	
end 

assign RD=(!rst)?32'd0: memory[A];

endmodule