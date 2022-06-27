`timescale 1ns / 1ns
`include "fbuadd.v"

module four_bit_FA_tb;

reg [3:0] A;
reg [3:0] B;
reg CIN;
wire [3:0] S;
wire CO;

four_bit_FA fbFA1(S,CO,A,B,CIN);

initial begin
    $dumpfile("fbuadd.vcd");
    $dumpvars(0,four_bit_FA_tb);

    A = 4'b1101;
    B = 4'b1111;
    CIN = 1'b0;

    #20;

    A = 4'b1000;
    B = 4'b1010;
    CIN = 1'b0;

    #20;

    A = 4'b0110;
    B = 4'b0111;
    CIN = 1'b0;

    #20;
end
endmodule
