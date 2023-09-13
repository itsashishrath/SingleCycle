module InstrMem(
	input [31:0]A,
	output [31:0] RD,
	input rst 
	);
	
	reg [31:0] Mem[1023:0];
	
	initial begin
    $readmemh("memfile.hex",Mem);
  end


	assign RD =(rst==1'b0)? 32'd0:Mem[A];
	
	


endmodule
	

	
