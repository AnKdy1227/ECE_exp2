module statework( rst, clk, 
                    daynight, st, bt_manual,
                led_red, led_yellow, led_green, led_left,
                led_walk_red, led_walk_green);
                
input clk;
input rst;
//input [3:0] st;
input daynight;
input [7:0] bt_manual;

wire [7:0] bt_trig;

oneshot #(.WIDTH(8)) O2(clk, rst, bt_manual, bt_trig);


parameter stateA1 = 4'b0000;
parameter stateB = 4'b0001;
parameter stateC = 4'b0010;
parameter stateD = 4'b0011;
parameter stateE1 = 4'b0100;
parameter stateF = 4'b0101;
parameter stateG = 4'b0110;
parameter stateH = 4'b0111;

parameter stateA2 = 4'b1000;
parameter stateE2 = 4'b1100;

output [3:0] st;

output [3:0] led_red;
output [3:0] led_yellow;
output [3:0] led_green;
output [3:0] led_left;
output [3:0] led_walk_red;
output [3:0] led_walk_green;               
                
                
reg [3:0] led_red;
reg [3:0] led_yellow;
reg [3:0] led_green;
reg [3:0] led_left;

reg [3:0] led_walk_red;
reg [3:0] led_walk_green;                

reg [31:0] cnt_1h;
reg [31:0] cnt_circle;
reg [31:0] daynight_circle;



reg [3:0] st;
reg [3:0] st2;
reg [3:0] st3;

reg [7:0] bt_trig_t;

wire clk_1h;
wire clk_flicker;


//always @(negedge rst or posedge clk )
//begin
//    if(!rst)
//    daynight_circle <= 40;
    


//end



 always @ (negedge rst or posedge clk)
 begin
    if(!rst) begin
        cnt_1h <= 0;
        cnt_circle <= 0 ;
        daynight_circle <= 40;
        bt_trig_t <= 1'b0;
        
        //st <= stateB;
      //  st3<= stateB;
        end
           
           else if( bt_trig_t >= 8'b00000001 && cnt_circle == 4) begin
    case(bt_trig_t)
    8'b00000001 : begin
                 //   st <= stateA1;
                 //   st3 <= stateA1;
                    cnt_circle <= 0;
                    bt_trig_t <= 8'b00000000;
                    end
                   
    8'b00000010 : begin
               //     st <= stateB;
                  //   st3 <= stateA1;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
    8'b00000100 : begin
              //      st <= stateC;
                 //    st3 <= stateC;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
    8'b00001000 : begin
             //       st <= stateD;
               //      st3 <= stateD;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
                  
    8'b00010000 : begin
              //      st <= stateE1;
                 //    st3 <= stateE1;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
    8'b00100000 : begin 
              //       st <= stateF;
             //         st3 <= stateF;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
    8'b01000000 : begin 
               //     st <= stateG;
                //     st3 <= stateG;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
                  end
    8'b10000000 : begin 
          //          st <= stateH;
             //        st3 <= stateH;
                  cnt_circle <= 0;
                  bt_trig_t <= 8'b00000000;
    end
    endcase
end

        
    else 
        if(cnt_1h >= 240) begin  // 10,000sec
           cnt_1h <= 0;
          cnt_circle <= cnt_circle + 1;
           end
          
 
           else  if(bt_trig >= 8'b00000001)  begin
                   daynight_circle <= 120;
                 //  st2 <= st;
                      cnt_1h <= 0;
                  cnt_circle <= 0;
                     bt_trig_t <= bt_trig; 
                   end
                   
//                       else if((clk_1h == 1'b1) && ( cnt_circle == daynight_circle)) begin
//        st <= st2;
//         cnt_1h <= cnt_1h + 1;
//         end
                   
         
      else
        if(cnt_circle >= daynight_circle + 1) begin
            cnt_circle <= 0;
            
           
             if( daynight == 0)
                    daynight_circle <= 40;
    
             else if (daynight == 1)
                    daynight_circle <= 80;
             

            end
          
         
   
     else 
          cnt_1h <= cnt_1h + 1;
    end
 
    assign clk_1h = (cnt_1h >= 240) ? 1 : 0; 
 assign clk_flicker = (cnt_1h <= 120) ? 0 : 1;     

always @(posedge clk or negedge rst) begin
    if(!rst)  begin 
  //  st <= stateA1;
  st <= stateB;
  st2 <= stateB;
    end
    
//     else if(bt_trig >= 8'b00000001) begin
    
//      end
         else if( bt_trig_t >= 8'b00000001 && cnt_circle == 4) begin
    case(bt_trig_t)
    8'b00000001 : begin
                    st <= stateA1;
                   
                    end
                   
    8'b00000010 : begin
                    st <= stateB;
              
                  end
    8'b00000100 : begin
                    st <= stateC;
                   
                  end
    8'b00001000 : begin
                    st <= stateD;
                 
                  end
                  
    8'b00010000 : begin
                    st <= stateE1;
                  
                  end
    8'b00100000 : begin 
                     st <= stateF;
                   
                  end
    8'b01000000 : begin 
                    st <= stateG;
                    
                  end
    8'b10000000 : begin 
                    st <= stateH;
                     
    end
    endcase
end

     
     
     
     
  
     else  if(bt_trig >= 8'b00000001)  begin
    st2 <= st;
    end
    
     else if((clk_1h == 1'b1) && ( cnt_circle == daynight_circle)) begin
    case(daynight)
    0 :  // day
        case(st2)
        stateA1  :st2 <= stateD;
        stateD  : st2 <= stateF;
        stateF  : st2 <= stateE1;
        stateE1 : st2 <= stateG;
        stateG  : st2 <= stateE2;
        stateE2 : st2 <= stateA1;
        default : st2 <= stateA1;
       
    endcase
    
    1: // night
        case(st2)
        stateB  : st2 <= stateA1;
        stateA1 : st2 <= stateC;
        stateC  : st2 <= stateA2;
        stateA2 : st2 <= stateE1;
        stateE1  : st2 <= stateH;       
       default : st2 <= stateB;
        endcase
        
        
    endcase 
    
  st <= st2;
  
end
 
end

 always @(negedge rst or posedge clk)
 begin
    if(!rst)
        begin
            led_red <= 4'b0000;
            led_green <= 4'b0000;
            led_yellow <= 4'b0000;
            led_walk_red <= 4'b0000;
            led_walk_green <= 4'b0000;
            led_left <= 4'b0000;
         end

        
        else
            case(st)
                stateA1 : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2) )
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b1010;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0000;
                        end
                    else
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b1010;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1010;
                        led_walk_green <= 4'b0101;
                        end
                    else if(cnt_circle <= (daynight_circle))
                        begin
                        led_walk_red <= 4'b1010;
                        led_walk_green <= {1'b0, ~clk_flicker, 1'b0,~clk_flicker};
                        end
                     else
                        begin //  should delete this
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                        
                  end
                  
                   stateA2 : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b1010;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0000;
                        end
                    else
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b1010;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1010;
                        led_walk_green <= 4'b0101;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1010;
                        led_walk_green <= {1'b0, ~clk_flicker, 1'b0,~clk_flicker};
                        end
                     else
                        begin //  should delete this
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                        
                  end
                  
                  
                   stateB : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b0111;
                        led_green <= 4'b1000; //
                        led_yellow <= 4'b0000;
                        led_left <= 4'b1000;
                        end
                    else
                        begin   
                        led_red <= 4'b0111;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b1000;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1110;
                        led_walk_green <= 4'b0001;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1110;
                        led_walk_green <= {3'b000, ~clk_flicker}; //
                        end
                     else
                        begin  //
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                   end
                   
                      stateC : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1101;
                        led_green <= 4'b0010;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0010;
                        end
                    else
                        begin   
                        led_red <= 4'b1101;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0010;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1011;
                        led_walk_green <= 4'b0100;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1011;
                        led_walk_green <= {1'b0, ~clk_flicker, 2'b00};
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                  end
                  
                     stateD : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b1010;
                        end
                    else
                        begin   
                        led_red <= 4'b0101;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b1010;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end
               
               
                     stateE1 : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0101;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0000;
                        end
                    else
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0101;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b0101;
                        led_walk_green <= 4'b1010;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b0101;
                        led_walk_green <= {~clk_flicker,1'b0,~clk_flicker, 1'b0};
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end
               
               
                     stateE2 : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0101;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0000;
                        end
                    else
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0101;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b0101;
                        led_walk_green <= 4'b1010;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b0101;
                        led_walk_green <= {~clk_flicker,1'b0,~clk_flicker, 1'b0};
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end
               
    
                     stateF : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1011;
                        led_green <= 4'b0100;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0100;
                        end
                    else
                        begin   
                        led_red <= 4'b1011;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0100;
                        led_left <= 4'b0100;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b0111;
                        led_walk_green <= 4'b1000;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b0111;
                        led_walk_green <= {~clk_flicker,3'b000};
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end
               
               
               
               
                     stateG : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1110;
                        led_green <= 4'b0001;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0001;
                        end
                    else
                        begin   
                        led_red <= 4'b1110;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0001;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1101;
                        led_walk_green <= 4'b0010;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1101;
                        led_walk_green <= {2'b00, ~clk_flicker, 1'b0};
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end  
               
               
               
                     stateH : 
                    begin
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0000;
                        led_left <= 4'b0101;
                        end
                    else
                        begin   
                        led_red <= 4'b1010;
                        led_green <= 4'b0000;
                        led_yellow <= 4'b0101;
                        led_left <= 4'b0000;
                        end
                    if(cnt_circle <= ((daynight_circle)/2))
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                    else if(cnt_circle <= daynight_circle)
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
                     else
                        begin
                        led_walk_red <= 4'b1111;
                        led_walk_green <= 4'b0000;
                        end
               end
               
           
               default :
                    begin
                    led_red <= 4'b0000;
                    led_green <= 4'b0000;
                    led_yellow <= 4'b0000;
                    led_walk_red <= 4'b0000;
                    led_walk_green <= 4'b0000;                 
                    end
               endcase
 end
 
 endmodule