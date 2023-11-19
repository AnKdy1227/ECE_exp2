`timescale 1us/1ns
module tb_LCDcursor();

reg rst, clk;
reg [9:0] number_btn;
reg [1:0] control_btn;
reg switch;

wire LCD_E, LCD_RS, LCD_RW;
wire [7:0] LCD_DATA;
wire [7:0] LED_out;

LCD_cursor L1(rst, clk, LCD_E, LCD_RS, LCD_RW, LCD_DATA, LED_out, number_btn, control_btn, switch);

initial begin
    clk <= 0;
    rst <= 0;
    number_btn <= 0;
    control_btn <= 0;
    switch <= 0;
    #10 rst <= 1;
    #10 rst <= 0;
    #10 rst <= 1;
    
    #1e+6 control_btn <= 2'b01;
    #1e+6 number_btn <= 10'b0010_0000_000;
    
    #1e+6 control_btn <= 2'b01;
    #1e+6 number_btn <= 10'b000_0100_000;
    
    end
    
     always begin
    #0.5 clk <= ~clk;
    end
    endmodule
    
    
    
    