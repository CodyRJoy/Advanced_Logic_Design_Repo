`timescale 1ns / 1ps
module Second_Order_Babbage#(parameter Maxxvalue = 5)(
    input [15:0] const0,
    input [15:0] const1,
    input [15:0] const2,
    output [15:0] position

    );
    
    wire [15:0] f_curr [Maxxvalue:0];
    wire [15:0] f_next [Maxxvalue:0];
    wire [15:0] g_curr [Maxxvalue:0];
    wire [15:0] g_next [Maxxvalue:0];
    wire [15:0] h_curr [Maxxvalue:0];
    
    assign f_curr[0] = const0;
    assign g_curr[0] = const2 + const1;
    assign h_curr[0] = 2*const2;
    
    generate
    genvar i;
    for(i=0;i<Maxxvalue+1;i=i+1) begin:bab
        assign f_next[i] = f_curr[i] + g_curr[i];
        assign g_next[i] = g_curr[i] + h_curr[i];
        assign f_curr[i+1] = f_next[i];
        assign g_curr[i+1] = g_next[i];
        assign h_curr[i+1] = h_curr[i];
    end
    endgenerate
    assign position = f_curr[Maxxvalue];
endmodule
