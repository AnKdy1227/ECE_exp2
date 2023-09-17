module tb_encoder42();

reg [3:0] D;

wire x,y,V;

encoder_42 u1(D,x,y,V);

initial begin

 D = 4'b0000;
 #10
 D = 4'b1000;
 #10
 D = 4'b1011;
 #10
 D = 4'b0101;
#10
 D = 4'b0001;
 end
 endmodule