`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2017 01:46:13 AM
// Design Name: 
// Module Name: Babbage_Difference_Engine_Test
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


module Babbage_Difference_Engine_Test;
    reg [15:0] bag3const0;
    reg [15:0] bag3const1;
    reg [15:0] bag3const2;
    reg [15:0] bag3const3;
    wire[15:0] bag3position;
    reg [15:0] bag2const0;
    reg [15:0] bag2const1;
    reg [15:0] bag2const2;
    wire[15:0] bag2position;      
       
            Third_Order_Babbage#(4) Bab3(
                .const0(bag3const0),
                .const1(bag3const1),
                .const2(bag3const2),
                .const3(bag3const3),
                .position(bag3position)
                );
              
    
        
            Second_Order_Babbage#(4) Bab2(
                .const0(bag2const0),
                .const1(bag2const1),
                .const2(bag2const2),
                .position(bag2position)
                
                );
        
        
        
        
        
        initial
        begin
        bag3const0 <= 1;
        bag3const1 <= 2;
        bag3const2 <= 2;
        bag3const3 <= 1;
        bag2const0 <= 5;
        bag2const1 <= 3;
        bag2const2 <= 2;
        end
        
    
endmodule
