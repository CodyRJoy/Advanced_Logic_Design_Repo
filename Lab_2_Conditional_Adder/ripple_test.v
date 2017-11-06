`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2017 12:16:55 AM
// Design Name: 
// Module Name: ripple_test
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


module ripple_test;

    
    reg [7:0] x;
    reg [7:0] y;
    reg mode;
    reg cin;
    wire [7:0] sum;
    wire cout;
    
    ripple RA(
    
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
       #200;
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
       y <= 87;
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
