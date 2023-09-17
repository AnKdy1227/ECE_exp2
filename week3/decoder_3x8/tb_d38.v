module tb_d38();

reg x,y,z;
wire D;

decoder_3x8 u1(x,y,z, D);

initial begin

x = 1'b0; y = 1'b0; z = 1'b0;
#10
x = 1'b0; y = 1'b0; z = 1'b1;
#10
x = 1'b0; y = 1'b1; z = 1'b0;
#10
x = 1'b1; y = 1'b0; z = 1'b0;
#10
x = 1'b0; y = 1'b1; z = 1'b1;
#10
x = 1'b1; y = 1'b0; z = 1'b1;
#10
x = 1'b1; y = 1'b1; z = 1'b0;
#10
x = 1'b1; y = 1'b1; z = 1'b1;
end
endmodule