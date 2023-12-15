module	clock ( 
					clk,rst,
					dip,
					bt,
					hour_10, hour1,
					min_10, min1,
					sec_10, sec1,
					daynight);
					
	input				clk, rst;
	input           [1:0] dip;
	input              bt;
	output			[3:0] hour_10, hour1, min_10, min1, sec_10, sec1;
	output daynight;
	
	wire				w_m, w_h;
	wire				clk1;
//	wire                clk_state;
	wire[3:0]               hour_10, hour1;
	//wire[3:0]          rhour_10, rhour1;
	
	
	
	clkone_gen		U0 ( 
							  .clk		(clk),
							  .rst		(rst),
							  .dip       (dip),
							  .clk1		(clk1) );
	
	second			U1 ( 
							  .clk		(clk1),
							  .rst		(rst),
							  .w_m		(w_m),
							  .sec_10	(sec_10),
							  .sec1		(sec1) );
	
	minute			U2 ( 
							  .w_m		(w_m),	
							  .rst		(rst),
							  .w_h		(w_h),
							  .min_10	(min_10),
							  .min1		(min1) );
							  
	hour				U3 ( 
	                          
							  .w_h		(w_h),	
							  .rst		(rst),
							 .hplus  (hplus),
							 
							   //.clk_state		(clk_state),
							  .hour_10	(hour_10),
							  .hour1		(hour1) );
	
	
hourbt             U4 ( .clk       (clk),
	                        .rst       (rst),
	                        .bt        (bt),
	                        .hplus     (hplus)   );
							  
	trafficstate  U5 (
	                      .clk (clk),
	                      .rst (rst),
	                      .hour_10  (hour_10),
	                      .hour1    (hour1),
	                      .daynight (daynight) );

endmodule