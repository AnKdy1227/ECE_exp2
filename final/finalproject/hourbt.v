module hourbt( clk, rst, bt, hplus);

input clk, rst;
input bt;

output hplus;
reg hplus;


oneshot #(.WIDTH(1))  O1(clk, rst, bt, bt_trig);

always @(posedge clk or negedge rst) begin
    if(!rst)
    hplus <= 1'b0;
    
    else if(bt_trig) begin
        hplus <= 1'b1;
        end
        
        else   
        hplus <= 1'b0;
        
     end
     
     endmodule