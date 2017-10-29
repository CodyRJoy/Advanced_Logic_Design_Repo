`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2017 01:54:50 AM
// Design Name: 
// Module Name: HA1
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


`timescale 1ns / 1ps

module HA1(
    input [7:0]x,
    input [7:0]y,
    output [15:0]r
    );
    assign r[0] = x[0]^y[0];
    assign r[1] = x[0]&y[0];
    assign r[2] = x[1]^y[1];
    assign r[3] = x[1]&y[1];
    assign r[4] = x[2]^y[2];
    assign r[5] = x[2]&y[2];
    assign r[6] = x[3]^y[3];
    assign r[7] = x[3]&y[3];
    assign r[8] = x[4]^y[4];
    assign r[9] = x[4]&y[4];
    assign r[10] = x[5]^y[5];
    assign r[11] = x[5]&y[5];
    assign r[12] = x[6]^y[6];
    assign r[13] = x[6]&y[6];
    assign r[14] = x[7]^y[7];
    assign r[15] = x[7]&y[7];
        
endmodule

