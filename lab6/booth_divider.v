module Booth_Divider(Z,valid,clk,rst,start,X,Y);

input clk;
input rst;
input start;
input signed [3:0]X,Y;
output signed [7:0]Z;
output valid;

reg signed [7:0] Z,next_Z,Z_temp;
reg next_state, pres_state;
reg [1:0] count,next_count;
reg valid, next_valid;

parameter IDLE = 1'b0;
parameter START = 1'b1;

always @ (posedge clk or negedge rst)
begin
if(!rst)
begin
  Z          <= 8'd0;
  valid      <= 1'b0;
  pres_state <= 1'b0;
  count      <= 2'd0;
end
else
begin
  Z          <= next_Z;
  valid      <= next_valid;
  pres_state <= next_state;
  count      <= next_count;
end
end

always @ (*)
begin 
case(pres_state)
IDLE:
begin
next_count = 2'b0;
next_valid = 1'b0;
if(start)
begin
    next_state = START;
    next_Z     = {4'd0,X};
end
else
begin
    next_state = pres_state;
    next_Z     = 8'd0;
end
end

START:
begin
Z_temp = {Z[6:3]-Y,Z[2:0],1'b0};
next_count = count + 1'b1;
next_Z     = {Z_temp[7:1],~Z_temp[7]};
    if(Z_temp[7] == 1'b1)
    begin
        next_Z[7:4] = next_Z[7:4] + Y;
    end
next_valid = (&count) ? 1'b1 : 1'b0; 
next_state = (&count) ? IDLE : pres_state;	
end
endcase
end
endmodule
