`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/06 19:36:48
// Design Name: 
// Module Name: tb_123
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_123();

reg a,b;
wire v,w,x,y,z;

logic_gate BCD(.a(a),.b(b),.v(v),.w(w), .x(x),. y(y), .z(z));

initial begin

a=1'b0;
b=1'b0;

#10
a=1'b0;
b=1'b1;

#10
a=1'b1;
b=1'b0;

#10
a=1'b1;
b=1'b1;

end

endmodule
