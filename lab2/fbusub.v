module HA(
    output s,
    output co,
    input a,
    input b
);
  xor x1(s,a,b);
  and a1(co,a,b);
endmodule

module FA(
    output s,
    output co,
    input a,
    input b,
    input ci
);
  wire x,y,z;
  HA h1(x,y,a,b);
  HA h2(s,z,x,ci);
  or o1(co,y,z);
endmodule

module four_bit_FA(
    output [3:0] s,
    output co,
    input [3:0] a,
    input [3:0] b,
    input ci
);
    wire [2:0] w;
    FA f1(s[0],w[0],a[0],b[0],ci);
    FA f2(s[1],w[1],a[1],b[1],w[0]);
    FA f3(s[2],w[2],a[2],b[2],w[1]);
    FA f4(s[3],co,a[3],b[3],w[2]);
endmodule

module four_bit_FS(
    output [3:0] s,
    output bo,
    input [3:0] a,
    input [3:0] b
);
    wire [3:0] nb;
    wire c;
    xor x1(nb[0],b[0],1'b1);
    xor x2(nb[1],b[1],1'b1);
    xor x3(nb[2],b[2],1'b1);
    xor x4(nb[3],b[3],1'b1);
    four_bit_FA f1(s,c,a,nb,1'b1);
    xor x5(bo,c,1'b1);
endmodule
