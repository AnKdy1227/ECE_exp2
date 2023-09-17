module mux_41(I0, I1, I2, I3, S, Y);

output [1:0] Y;
input [1:0] I0, I1, I2, I3;
input [1:0] S;

assign Y = S[1] ? (S[0] ? I3:I2) : (S[0] ? I1:I0);

endmodule