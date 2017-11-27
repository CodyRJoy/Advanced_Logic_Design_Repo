`timescale 1ns / 1ps
module Carry_Lookahead_Test;
    
    reg [7:0] x;
    reg [7:0] y;
    reg mode;
    reg cin;
    wire [7:0] sum;
    wire cout;
    
    Carry_Lookahead_8bit CLA(
    
        .x(x),
        .y(y),
        .mode(mode),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial
    begin
    x <= 127;
    y <= 1;
    mode <= 0;
    cin <= 0;
    #100;
    x <= 128;
    y <= 127;
    mode <= 1;
    cin <= 1;
    #100;
    x <= 255;
    y <= 0;
    mode <= 0;
    cin <= 0;
    #100;
    mode <= 1;
    cin <= 1;
    #100;
    x <= 117;
    y <= 85;
    mode <= 0;
    cin <= 0;
    #100;
    mode <= 1;
    cin <= 1;
    #100;
    x <= 119;
    y <= 57;
    mode <= 0;
    cin <= 0;
    #100;
    mode <= 1;
    cin <= 1;
    #100;
    $finish;
        
    end
  
endmodule
