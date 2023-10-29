module tb_SM2();

//module SM2(clk, rst, A, B, C, state, y);

reg clk, rst, A, B, C;

wire [2:0] state;
wire y;

SM2 u1(clk, rst, A, B, C, state, y);

initial begin
    clk <= 0;
    rst <= 1;
    A <=0;
    B <=0;
    C <=0;
    #10 rst <= 0;
    #10 rst <= 1;
    
    #10 A <= 1;
    #10 A <= 0;
    
    #10 B <= 1;
    #10 B <= 0;
  
    #10 A <= 1;
    #10 A <= 0;
    
    #10 B <= 1;  
    #10 B <= 0;
    
    #10 C <= 1;
    #10 C <= 0;
    
    #10 rst <= 0;
    #10 rst <= 1;
    
    #10 A <= 1;
    #10 A <= 0;
    
    #10 B <= 1;
    #10 B <= 0;
  
    #10 C <= 1;
    #10 C <= 0;
    
    #10 rst <= 0 ;
 end
 
 always begin
    #5 clk <= ~clk;
   end
 endmodule 
    