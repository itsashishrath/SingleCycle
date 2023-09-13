module SingleCycleProcessor_tb ();
    
    reg clk=1'b1,rst;
	 reg 

    SingleCycleProcessor Single_Cycle_Top(
                     
							.clk(clk),
                     .rst(rst)
    );

    initial begin
        $dumpfile("SingleCycleProcessor.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
		  
        $finish;
    end
endmodule