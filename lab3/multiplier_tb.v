`timescale 1ns / 1ns
`include "multiplier.v"

module four_bit_MUL_tb;

reg [3:0] A;
reg [3:0] B;
wire [7:0] M;
wire CO;

MUL4x4 m1(M,CO,A,B);

initial begin
    $dumpfile("fbupp.vcd");
    $dumpvars(0,four_bit_MUL_tb);

    A = 4'b0101;
    B = 4'b0011;

    #100;
end
endmodule
