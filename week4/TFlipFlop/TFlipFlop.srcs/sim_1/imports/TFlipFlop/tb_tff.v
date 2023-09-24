module tb_tff();

reg clk, rst, T;
wire Q;

TFF u1(clk, rst, T, Q);

initial begin
    clk <= 0;
    rst <= 1;
    #10 rst <= 0;
    #10 rst <= 1;
    #80 T <= 0;
    #80 T <=1;
    #80 T <= 0;
    #80 T <=1;
    #80 T <= 0;
    #80 T <=1;
end

always begin
    #5 clk <= ~clk;
end

endmodule

