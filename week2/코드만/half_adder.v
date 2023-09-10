module half_adder( a, b, s, c);

input a, b;
output s, c;

reg s,c;
//------------------------------------------------------
// 교안에 나와있는 half_adder 
//always @(a or b)     
//begin
//    if (a==b) s = 0;
//    else s =1;
    
//    if (a==1 && b==1) c=1;
//    else c=0;
//  end 
  
//  endmodule
//------------------------------------------------------
// 예비 6.5) 논리식을 이용한 코드
//always @(*)
//begin

// c = a&b;
// s = (a&(~b)) + ((~a)&b);
//end
//endmodule
//------------------------------------------------------
// 예비 6.6) case문을 이용한 코드
always @(*)begin
case({a,b})   

    2'b00 : {s,c} = 2'b00;
    2'b01 : {s,c} = 2'b10;
    2'b10 : {s,c} = 2'b10;
    2'b11 : {s,c} = 2'b01;
    
   
endcase
end
endmodule
    



