module regFile(
	input clk,
	input rst,
	input [4:0] A1,
	input [4:0] A2,
	input [4:0] A3,
	input [31:0] WD3,
	input WE3,
	output [31:0]RD1,
	output [31:0]RD2
	
	);

reg [31:0] Register [31:0];

    assign RD1 = (~rst) ? 32'd0 : Register[A1];
    assign RD2 = (~rst) ? 32'd0 : Register[A2];

always @(posedge clk ) begin
	if (WE3) begin
		Register[A3]<=WD3;
	end 
end


endmodule