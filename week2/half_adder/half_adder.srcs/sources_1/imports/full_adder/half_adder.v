module half_adder( a, b, s, c);

input a, b;
output s, c;

reg s,c;
//------------------------------------------------------
// ���ȿ� �����ִ� half_adder 
//always @(a or b)     
//begin
//    if (a==b) s = 0;
//    else s =1;
    
//    if (a==1 && b==1) c=1;
//    else c=0;
//  end 
  
//  endmodule
//------------------------------------------------------
// ���� 6.5) ������ �̿��� �ڵ�
//always @(*)
//begin

// c = a&b;
// s = (a&(~b)) + ((~a)&b);
//end
//endmodule
//------------------------------------------------------
// ���� 6.6) case���� �̿��� �ڵ�
always @(*)begin
case({a,b})   

    2'b00 : {s,c} = 2'b00;
    2'b01 : {s,c} = 2'b10;
    2'b10 : {s,c} = 2'b10;
    2'b11 : {s,c} = 2'b01;
    
   
endcase
end
endmodule
    



