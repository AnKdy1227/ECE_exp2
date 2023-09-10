module tb_ha();

reg a,b;
wire s,c;

half_adder u2(a,b,s,c);

initial begin
a=0; b=0; #10
a=0; b=1; #10
a=1; b=0; #10
a=1; b=1; #10
end
endmodule
