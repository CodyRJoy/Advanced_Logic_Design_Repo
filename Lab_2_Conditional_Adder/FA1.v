`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2017 01:56:01 AM
// Design Name: 
// Module Name: FA1
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

module FA1(
    input [7:0]x,
    input [7:0]y,
    output [15:0]r,
    input cin
    );
    assign r[0]=  ((~cin) & x[0] &(~y[0])) | ((~cin) &(~x[0])&y[0] ) | (cin &(~x[0]) &(~y[0])) | (cin & x[0] & y[0])     ;
    assign r[1] = ((~cin) & x[0] &y[0]) | ((cin) &(~x[0])&y[0] ) | (cin &(x[0]) &(~y[0])) | (cin & x[0] & y[0])  ;
    assign r[2]=  ((~cin) & x[1] &(~y[1])) | ((~cin) &(~x[1])&y[1] ) | (cin &(~x[1]) &(~y[1])) | (cin & x[1] & y[1])     ;
    assign r[3] = ((~cin) & x[1] &y[1]) | ((cin) &(~x[1])&y[1] ) | (cin &(x[1]) &(~y[1])) | (cin & x[1] & y[1])  ;
    assign r[4]=  ((~cin) & x[2] &(~y[2])) | ((~cin) &(~x[2])&y[2] ) | (cin &(~x[2]) &(~y[2])) | (cin & x[2] & y[2])     ;
    assign r[5] = ((~cin) & x[2] &y[2]) | ((cin) &(~x[2])&y[2] ) | (cin &(x[2]) &(~y[2])) | (cin & x[2] & y[2])  ;
    assign r[6]=  ((~cin) & x[3] &(~y[3])) | ((~cin) &(~x[3])&y[3] ) | (cin &(~x[3]) &(~y[3])) | (cin & x[3] & y[3])     ;
    assign r[7] = ((~cin) & x[3] &y[3]) | ((cin) &(~x[3])&y[3] ) | (cin &(x[3]) &(~y[3])) | (cin & x[3] & y[3])  ;
    assign r[8]=  ((~cin) & x[4] &(~y[4])) | ((~cin) &(~x[4])&y[4] ) | (cin &(~x[4]) &(~y[4])) | (cin & x[4] & y[4])     ;
    assign r[9] = ((~cin) & x[4] &y[4]) | ((cin) &(~x[4])&y[4] ) | (cin &(x[4]) &(~y[4])) | (cin & x[4] & y[4])  ;
    assign r[10]=  ((~cin) & x[5] &(~y[5])) | ((~cin) &(~x[5])&y[5] ) | (cin &(~x[5]) &(~y[5])) | (cin & x[5] & y[5])     ;
    assign r[11] = ((~cin) & x[5] &y[5]) | ((cin) &(~x[5])&y[5] ) | (cin &(x[5]) &(~y[5])) | (cin & x[5] & y[5])  ;
    assign r[12]=  ((~cin) & x[6] &(~y[6])) | ((~cin) &(~x[6])&y[6] ) | (cin &(~x[6]) &(~y[6])) | (cin & x[6] & y[6])     ;
    assign r[13] = ((~cin) & x[6] &y[6]) | ((cin) &(~x[6])&y[6] ) | (cin &(x[6]) &(~y[6])) | (cin & x[6] & y[6])  ;
    assign r[14]=  ((~cin) & x[7] &(~y[7])) | ((~cin) &(~x[7])&y[7] ) | (cin &(~x[7]) &(~y[7])) | (cin & x[7] & y[7])     ;
    assign r[15] = ((~cin) & x[7] &y[7]) | ((cin) &(~x[7])&y[7] ) | (cin &(x[7]) &(~y[7])) | (cin & x[7] & y[7])  ;
    
endmodule
