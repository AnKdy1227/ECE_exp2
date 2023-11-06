module tb_segarray();

// module seg_array(clk, rst, btn, seg_data, seg_sel);

reg clk, rst, btn;

wire [7:0] seg_data;
wire [7:0] seg_sel;

seg_array u1(clk, rst, btn, seg_data, seg_sel);

initial begin 
    clk <= 0;
    btn <= 0;
    rst <= 0;
    
    #10 rst <= 1 ;
         
     #30 btn <= 1;   //1
     #10 btn <= 0;
   
    #100 btn <= 1;  //2
    #10 btn <= 0;   
   
    #100 btn <= 1;  //3
    #10 btn <= 0;
   
    #100 btn <= 1; //4
    #10 btn <= 0;
   
    #100 btn <= 1; //5
    #10 btn <= 0;
   
    #100 btn <= 1; //6
    #10 btn <= 0;
   
    #100 btn <= 1;  //7
    #10 btn <= 0;
   
   #10 btn <= 1;
   #10 btn <= 0;
   #10 btn <= 1;
   #10 btn <= 0; 
   #10 btn <= 1;
   #10 btn <= 0;
   #10 btn <= 1;
   #10 btn <= 0;
   #100 btn <= 1;     // 12
   #10 btn <= 0;
   
   
   #100 rst <= 0;
   end
 
 
 always begin
    #5 clk <= ~clk;
    end
 endmodule
    
    