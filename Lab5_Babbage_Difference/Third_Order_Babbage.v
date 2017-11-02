`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2017 02:33:39 AM
// Design Name: 
// Module Name: Third_Order_Babbage
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


module Third_Order_Babbage#(parameter Maxxvalue = 5)(
    input [15:0] const0,
    input [15:0] const1,
    input [15:0] const2,
    input [15:0] const3,
    output [15:0] position
    );
    
    wire [15:0] f_curr [Maxxvalue:0];
    wire [15:0] f_next [Maxxvalue:0];
    wire [15:0] g_curr [Maxxvalue:0];
    wire [15:0] g_next [Maxxvalue:0];
    wire [15:0] h_curr [Maxxvalue:0];
    wire [15:0] h_next [Maxxvalue:0];
    wire [15:0] j_curr [Maxxvalue:0];
    wire [15:0] f_curr0;
    wire [15:0] f_curr1;
    wire [15:0] f_curr2;
    wire [15:0] f_curr3;
    wire [15:0] g_curr0;
    wire [15:0] g_curr1;
    wire [15:0] g_curr2;
    wire [15:0] h_curr0;
    wire [15:0] h_curr1;
    wire [15:0] j_curr0;
    
    assign f_curr0 = const0;
    assign f_curr1 = const3 + const2 + const1 + const0;
    assign f_curr2 = 8*const3 + 4*const2 + 2*const1 + const0;
    assign f_curr3 = 27*const3 + 9*const2 + 3*const1 + const0;
    assign g_curr0 = f_curr1-f_curr0;
    assign g_curr1 = f_curr2-f_curr1;
    assign g_curr2 = f_curr3-f_curr2;
    assign h_curr0 = g_curr1-g_curr0;
    assign h_curr1 = g_curr2-g_curr1;
    assign j_curr0 = h_curr1-h_curr0;
    
    generate
    genvar i;
    for(i=0;i<Maxxvalue+1;i=i+1) begin:bab
        assign f_curr[0] = f_curr0;
        assign g_curr[0] = g_curr0;
        assign h_curr[0] = h_curr0;
        assign j_curr[0] = j_curr0;
        assign f_next[i] = f_curr[i] + g_curr[i];
        assign g_next[i] = g_curr[i] + h_curr[i];
        assign h_next[i] = h_curr[i] + j_curr[i];
        assign f_curr[i+1] = f_next[i];
        assign g_curr[i+1] = g_next[i];
        assign h_curr[i+1] = h_next[i];
        assign j_curr[i+1] = j_curr[i];
    end
    endgenerate
    assign position = f_curr[Maxxvalue];
endmodule

