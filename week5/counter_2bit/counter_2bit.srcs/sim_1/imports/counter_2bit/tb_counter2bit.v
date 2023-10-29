module tb_counter2bit();


reg clk, rst, x;
wire [1:0] state;

counter_2bit u1(clk, rst, x, state);

initial begin
    clk <=0;
    rst <=1;
    x = 0;
    #10 rst <= 0;
    #10 rst <= 1;
    
    #10 x <= 1;
    #10 x <= 0;
    
    #30 x<=1;
    #30 x<=0;
    
    #10 x<=1;
    #10 x<=0;
    
    #10 x<=1;
    #10 x<=0;
    #10 x<=1;
    #10 x<=0;
    #10 x<=1;
    #10 x<=0;
    
    
  end
 
 always begin
    #5 clk <= ~clk;
  end
 endmodule  