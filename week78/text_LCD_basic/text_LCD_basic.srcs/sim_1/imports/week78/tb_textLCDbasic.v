module tb_textLCDbasic();

reg rst, clk;

wire LCD_E, LCD_RS, LCD_RW;

wire [7:0] LCD_DATA;
wire [7:0] LED_out;

text_LCD_basic t1(rst, clk, LCD_E, LCD_RS, LCD_RW, LCD_DATA, LED_out);

initial begin
    clk = 0;
    rst = 0;

    #10 rst <= 1;
    
  end
  
  always begin
  #5 clk <= ~clk;
  
  end
  
  endmodule
  
      