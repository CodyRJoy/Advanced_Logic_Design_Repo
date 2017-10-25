`timescale 1ns / 1ps

module FA(
    input x,
    input y,
    input cin,
    output [1:0]r
    );
    assign r[0]=  ((~cin) & x &(~y)) | ((~cin) &(~x)&y ) | (cin &(~x) &(~y)) | (cin & x & y)     ;
    assign r[1] = ((~cin) & x &y) | ((cin) &(~x)&y ) | (cin &(x) &(~y)) | (cin & x & y)  ;
endmodule
