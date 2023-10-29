module tb_SM1();

reg clk, rst, x;
wire [1:0]state;
wire  y;

SM1 u1(clk, rst, x, y, state);

initial begin
    clk <= 0;
    rst <= 1; 
    x <= 0;
    #10 rst <= 0;
    #10 rst <= 1;  // Set State 2'b00
    
//    #30 x <= 1'b1; // state 2'b00 input 1 -> state 2'b01   4.1.1
//    #30 x <= 1'b0; // state 2'01 input 0 -> state 2'b00    4.1.2
     
     
    #10 x <= 1'b1; // state 2'b00 input 1 -> state 2'b01   4.1.1
    #10 x <= 1'b1; // state 2'b01 input 1 -> state 2'b11   4.1.3
//   #10 x <= 2'b0; // state 2'b11 input 0 -> stae 2'b00   4.1.6
   
    #10 x <= 1'b1; // state 2'b11 input 1 -> state 2'b10 
  //  #10 x <= 1'b0; // state 2'b10 input 0 -> state 2'b00   4.1.4
    #10 x <= 1'b1; // state 2'b10 input 1 -> state 2'b10   4.1.5
    
    
   end
    
always begin
   #5 clk <= ~clk;
end
   
   endmodule