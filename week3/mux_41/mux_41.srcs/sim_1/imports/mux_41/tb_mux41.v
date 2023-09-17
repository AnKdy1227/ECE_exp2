module tb_mux41();

reg [1:0] I0, I1, I2, I3;
reg [1:0] S;

wire [1:0] Y;

mux_41 u1(I0, I1, I2, I3, S, Y);

initial begin

I0 = 2'b00;
I1 = 2'b01;
I2 = 2'b10;
I3 = 2'b11;

#10
S = 2'b00;
#10
S = 2'b01;
#10
S = 2'b10;
#10
S = 2'b11;


end
endmodule