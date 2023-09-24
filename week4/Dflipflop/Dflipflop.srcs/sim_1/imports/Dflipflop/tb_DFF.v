module tb_DFF();

reg clk, D;
wire Q;

DFF u1(clk, D, Q);

initial begin
    clk <= 0;
    #30 D <= 0;
    #30 D <= 1;
    #30 D <= 0;
    #30 D <= 1;
    #30 D <= 0;
    #30 D <= 1;
    
   end
   
 always begin
    #5 clk<= ~clk;
 end
 
 endmodule
    