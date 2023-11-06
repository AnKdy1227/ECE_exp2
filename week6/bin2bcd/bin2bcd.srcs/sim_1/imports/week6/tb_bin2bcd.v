module tb_bin2bcd();

reg clk, rst;
reg [3:0] bin;

wire [7:0] bcd;

bin2bcd u1(clk, rst, bin, bcd);

initial begin
    clk <= 0;
    rst <= 1;
    bin <= 4'b0000;
    
    #20 bin <= 4'b0001;     //1
    #20 bin <= 4'b0010;     //2
    #20 bin <= 4'b0011;     //3
    #20 bin <= 4'b0100;     //4
    #20 bin <= 4'b0101;     //5
    #20 bin <= 4'b0110;     //6
    #20 bin <= 4'b0111;     //7
    #20 bin <= 4'b1000;     //8
    #20 bin <= 4'b1001;     //9
    #20 bin <= 4'b1010;     //10
    #20 bin <= 4'b1011;     //11
    #20 bin <= 4'b1100;     //12
    #20 bin <= 4'b1101;     //13
    #20 bin <= 4'b1110;     //14
    #20 bin <= 4'b1111;     //15
    
    rst <=1;
    end
    
 always begin
    #5 clk = ~clk;
   end
   
   endmodule
    
    
    
    
    