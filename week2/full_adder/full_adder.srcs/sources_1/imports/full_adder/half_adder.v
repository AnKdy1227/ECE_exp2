module half_adder( a, b, s, c);

input a, b;
output s, c;

reg s,c;

always @(a or b)
begin
    if (a==b) s = 0;
    else s =1;
    
    if (a==1 && b==1) c=1;
    else c=0;
  end 
  
  endmodule

//-------
//always @(*)
//begin

//assign c = a&b;
//assign s = a&(~b) + (~a)&b;
//end
//endmodule

//always @(*)begin
//case(a,b)   
//    a==1'b0, b==1'b0 : s=0,c=0;
//    a==1'b0, b==1'b1 : s=0,c=1;
//    a==1'b1, b==1'b0 : s=0,c=1;
//    a==1'b1, b==1'b1 : s=1,c=0;
//endcase
//end
//endmodule
    



