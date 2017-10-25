`timescale 1ns / 1ps

module Conditional_Adder#(parameter bits=8, levels=4)(
    //input [7:0] SW,
    //input BTNC,
    //output [3:0] LED
    input [bits-1:0] x,
    input [bits-1:0] y,
    input mode,
    output [4:0] answer
    );
    //wire [bits-1:0] FAsol [7:0] ;
    //wire [bits-1:0] HAsol [7:0] ;
    wire [levels - 1:0] resnc [bits - 1:0][(bits)-1:0];
    wire [levels - 1:0] reswc [bits - 1:0][(bits)-1:0];
    wire [levels - 1:0] tempnc [bits - 1:0][(bits)-1:0];
    wire [levels - 1:0] tempwc [bits - 1:0][(bits)-1:0];
    //wire [3:0] x;
    //wire [3:0] y;    
    //assign x = SW[3:0];
    //assign y = SW[7:4];
    
    generate
    genvar i,level;
    for (i=0; i<bits; i=i+1) begin:adder
        HA sumnocarry(.x(x[i]), .y(y[i]), .r(resnc[0][i][1:0]));
        FA sumwithcarry(.x(x[i]), .y(y[i]),.cin(1),.r(reswc[0][i][1:0]));
    end
    
    for(level=1;level<levels; level = level+1) begin:Muxouter
        for(i=0; i<bits/(2**level); i=i+1) begin:Muxinner
            assign tempnc[level-1][2*i][2**(level-1):0] =  resnc[level-1][2*i][2**(level-1)]?reswc[level-1][(2*i)+1]:resnc[level-1][(2*i)+1];
            assign resnc[level][i] = {tempwc[level-1][2*i][2**(level-1):0],resnc[level-1][2*i][(2**(level-1))-1:0]};
            assign tempwc[level-1][2*i] =  reswc[level-1][2*i][2**(level-1)]?reswc[level-1][(2*i)+1]:resnc[level-1][(2*i)+1];
            assign reswc[level][i] = {tempwc[level-1][2*i][2**(level-1):0],reswc[level-1][2*i][(2**(level-1))-1:0]};
        end
    end
    endgenerate
    //assign LED = mode?reswc[levels][0]:resnc[levels][0];
    assign answer[4:0] = resnc[2][0];
    //assign answer[7:0] = {tempwc[1][0][levels-1:0],reswc[levels-2][0][levels-2:0]};
   
endmodule
