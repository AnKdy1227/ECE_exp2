module encoder_42(D, x,y, V);

input [3:0] D;
output x,y,V;

wire x,y, V;

assign x = D[3]+D[2];
assign y = D[3] | (~D[2])&D[1];
assign V = D[0] |D[1]| D[2] | D[3];

endmodule

