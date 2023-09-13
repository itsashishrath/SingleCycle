module PC(
	input clk,
	input rst,
	output reg [31:0] pc_out,
	input [31:0] pc_in);


	 always @(posedge clk ) begin
		
		if (rst==1'b0)
			pc_out<=32'd0;
		else 
			pc_out<=pc_in;
		
		end
		
	 
endmodule
	

	


	