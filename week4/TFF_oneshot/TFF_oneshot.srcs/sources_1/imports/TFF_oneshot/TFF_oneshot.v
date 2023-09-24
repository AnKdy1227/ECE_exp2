module TFF_oneshot(clk, rst, T, Q);

input T, clk, rst;
reg T_reg, T_trig;
output reg Q;

always @(negedge rst) begin
    if(!rst) begin
        Q <= 1'b0;
        T_reg <= 1'b0;
        T_trig <= 1'b0;
         if(T_trig)
        Q <= ~Q;
     end
end

always @(posedge clk) begin
     T_reg <= T;
     T_trig <= T & ~T_reg;
      if(T_trig) 
        Q <= ~Q;
    
end
//--------------------------------------------------

//    always @(posedge clk or negedge rst)
//begin
//    if(!rst) begin
//        Q <= 1'b0;
//        T_reg <= 1'b0;
//        T_trig <= 1'b0;
//     end
//     else begin
//     T_reg <= T;
//     T_trig <= T & ~T_reg;
//    end
    
////  end   
////     always @(posedge clk) begin
//     if(T_trig) 
    
//        Q <= ~Q;
//end


endmodule