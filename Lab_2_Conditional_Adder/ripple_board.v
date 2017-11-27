`timescale 1ns / 1ps
module ripple#(parameter bits=8)(
    input [15:0] SW,
    input BTNC,
    output [8:0] LED
    );
    wire [bits:0] carry;
    wire [bits-1:0] ty;
    wire [bits-1:0] x;
    wire [bits-1:0] y;
    wire [bits-1:0] sum;
    
    assign x[7:0] = SW[7:0];
    assign y[7:0] = SW[15:8];
    assign carry[0]=BTNC;
    assign LED[8]=carry[bits];
    
    generate
    genvar i;
    for (i=0;i<bits;i=i+1) begin:fa
        assign #10 ty[i]= y[i]^BTNC;
        assign #10 carry[i+1]= x[i]&ty[i] | x[i]&carry[i] | ty[i]&carry[i];
        assign #10 sum[i]= x[i]^ty[i]^carry[i];
    end
    endgenerate
    
    assign LED[7:0] = sum[7:0];
    
endmodule
