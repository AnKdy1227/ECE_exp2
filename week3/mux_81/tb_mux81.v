module tb_mux81();

reg [3:0] I0, I1, I2, I3, I4, I5, I6, I7;
reg [2:0] S;

wire [3:0] Y;

mux_81 u1(I0, I1, I2, I3, I4, I5, I6, I7, S, Y);

initial begin

I0 = 4'b0000;
I1 = 4'b0001;
I2 = 4'b0011;
I3 = 4'b0111;
I4 = 4'b1111;
I5 = 4'b1001;
I6 = 4'b0101;
I7 = 4'b1101;
#10
S = 3'b000;
#10
S = 3'b001;
#10
S = 3'b010;
#10
S = 3'b011;
#10
S = 3'b100;
#10
S = 3'b101;
#10
S = 3'b110;
#10
S = 3'b111;

end
endmodule

