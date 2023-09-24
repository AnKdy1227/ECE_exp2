module tb_jkff();

reg clk, J, K;
wire Q;

JKFF u1(clk, J, K, Q);

initial begin
    clk <= 0;
    #30 {J,K} <= 2'b00;
    #30 {J,K} <= 2'b01;
    #30 {J,K} <= 2'b00;
    #30 {J,K} <= 2'b10;
    #30 {J,K} <= 2'b00;
    #30 {J,K} <= 2'b11;
    #30 {J,K} <= 2'b00;
end

always begin
    #5 clk=~clk;
end

endmodule