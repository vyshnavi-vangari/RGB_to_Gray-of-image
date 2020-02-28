module image(
input wire r_to_v_clk,
input wire pred,pblu,pgreen,
output reg grey,black
);
integer counter;
reg [7:0]red;
reg [7:0] green;
reg [7:0] blue;
reg [9:0] grey2;
reg [9:0] grey3;
reg [7:0] grey1;
reg [1:0] det_edge;
initial begin
	counter = 0;
	grey1 =8'b0;
	grey2=8'b0;
	red=8'b0;
	green=8'b0;
	blue=8'b0;
	grey=0;
end

always@(negedge r_to_v_clk)
begin
	red[counter] = pred;
	green[counter] = pgreen;
	blue[counter] = pblu;
	
	grey=grey1[7-counter];
    	counter = counter + 1;

   if(counter == 8) begin
	grey2=(red+green+blue);
	grey1=8'd0;
	
	grey3=((grey2>>4)+(grey2>>2)+(grey2>>6)+(grey2>>8));
	grey1=grey3;
	grey2=10'd0;
	if(grey3>100) begin
		black=1;
	end
	else begin
		 black=0;
	end

   counter = 0;
   end
end
endmodule
