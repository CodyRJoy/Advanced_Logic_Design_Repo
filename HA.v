`timescale 1ns / 1ps

module HA(
    input x,
    input y,
    output [1:0]r
    );
    assign r[0] = x^y;
    assign r[1] = x&y;
endmodule
