`timescale 1ns / 1ns
`include "fbusub.v"

module four_bit_FS_tb;

reg [3:0] A;
reg [3:0] B;
wire [3:0] S;
wire BO;

four_bit_FS fbFS1(S,BO,A,B);

initial begin
    $dumpfile("fbusub.vcd");
    $dumpvars(0,four_bit_FS_tb);

    A = 4'b0110;
    B = 4'b0011;

    #20;
end
endmodule
