`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2017 11:28:37 PM
// Design Name: 
// Module Name: Carry_Lookahead_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
        x<= 8'b01111111;
        y<= 8'b00000001;
        mode<= 0;
        cin<= 0;
        #100
        x<= 8'b00000111;
        y<= 8'b00000001;
        mode<= 0;
        cin<= 0;
        
    end
  
endmodule
