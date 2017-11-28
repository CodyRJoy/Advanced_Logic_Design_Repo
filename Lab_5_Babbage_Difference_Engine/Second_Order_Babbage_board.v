`timescale 1ns / 1ps
module Second_Order_Babbage_board(
    input [15:0] SW,
    output reg [15:0] LED
    

    );
    wire [15:0] f_curr [15:0];
    wire [15:0] f_next [15:0];
    wire [15:0] g_curr [15:0];
    wire [15:0] g_next [15:0];
    wire [15:0] h_curr [15:0];
    
   
    assign f_curr[0] = 5;
    assign g_curr[0] = 5;
    assign h_curr[0] = 4;
    
    generate
    genvar i;
    for(i=0;i<15;i=i+1) begin:bab
        assign f_next[i] = f_curr[i] + g_curr[i];
        assign g_next[i] = g_curr[i] + h_curr[i];
        assign f_curr[i+1] = f_next[i];
        assign g_curr[i+1] = g_next[i];
        assign h_curr[i+1] = h_curr[i];
    end
    endgenerate
       always @* begin
        case(SW)
       15'b000000000000001: LED = f_curr[0];
       15'b000000000000010: LED = f_curr[1];
       15'b000000000000100: LED = f_curr[2];
       15'b000000000001000: LED = f_curr[3];
       15'b000000000010000: LED = f_curr[4];
       15'b000000000100000: LED = f_curr[5];
       15'b000000001000000: LED = f_curr[6];
       15'b000000010000000: LED = f_curr[7];
       15'b000000100000000: LED = f_curr[8];
       15'b000001000000000: LED = f_curr[9];
       15'b000010000000000: LED = f_curr[10];
       15'b000100000000000: LED = f_curr[11];
       15'b001000000000000: LED = f_curr[12];
       15'b010000000000000: LED = f_curr[13];
       15'b100000000000000: LED = f_curr[14];
       
    endcase
end
endmodule
