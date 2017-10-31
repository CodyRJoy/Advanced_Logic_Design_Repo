`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2017 08:37:47 PM
// Design Name: 
// Module Name: Parking_Lot
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


module Parking_Lot#(parameter No_Car_Gate1 = 3'b000, No_Car_Gate2 = 3'b100, Car_In_Gate1 = 3'b010, Car_Out_Gate1 = 3'b001, Car_In_Gate2 = 3'b110, Car_Out_Gate2 = 3'b101)(
input inout1_sensorA,
input inout1_sensorB,
input inout2_sensorA,
input inout2_sensorB,
input clk,
input rst,
output reg [1:0] num_cars
    );
reg [2:0] current_state_Gate1, next_state_Gate1;
reg [2:0] current_state_Gate2, next_state_Gate2;
wire Total_num_cars;
reg num_cars_next;
 initial num_cars = 1'b0;
 initial current_state_Gate1 = No_Car_Gate1; 
 initial current_state_Gate2 = No_Car_Gate2; 
 
 assign Total_num_cars = 4;
 
 always@(posedge clk or negedge rst)
 if(~rst) begin
    current_state_Gate1 = No_Car_Gate1;
    current_state_Gate2 = No_Car_Gate2;
    num_cars = 2'b00;
 end else begin
    current_state_Gate1 = next_state_Gate1;
    current_state_Gate2 = next_state_Gate2;
    num_cars = num_cars_next;
 end
 
always@(*) begin
case(current_state_Gate1)
No_Car_Gate1: begin
    case({inout1_sensorA, inout1_sensorB}) 
        2'b00: begin
            next_state_Gate1 = No_Car_Gate1;
            num_cars_next = num_cars;
            end
        2'b01: begin
            next_state_Gate1 = Car_Out_Gate1;
            num_cars_next = num_cars;
            end
        2'b10: begin
            next_state_Gate1 = Car_In_Gate1;
            num_cars_next = num_cars;
            end
        2'b11: begin
            next_state_Gate1 = No_Car_Gate1;
            num_cars_next = num_cars;
            end
        endcase
        end
Car_In_Gate1: begin
    case({inout1_sensorA, inout1_sensorB}) 
       2'b00: begin
           next_state_Gate1 = No_Car_Gate1;
           num_cars_next = num_cars;
           end
       2'b01: begin
           next_state_Gate1 = No_Car_Gate1;
           num_cars_next = num_cars + 1;
           end
       2'b10: begin
           next_state_Gate1 = Car_In_Gate1;
           num_cars_next = num_cars;
           end
       2'b11: begin
           next_state_Gate1 = Car_In_Gate1;
           num_cars_next = num_cars;
           end
       endcase
       end
Car_Out_Gate1: begin
  case({inout1_sensorA, inout1_sensorB}) 
      2'b00: begin
          next_state_Gate1 = No_Car_Gate1;
          num_cars_next = num_cars;
          end
      2'b01: begin
          next_state_Gate1 = Car_Out_Gate1;
          num_cars_next = num_cars;
          end
      2'b10: begin
          next_state_Gate1 = No_Car_Gate1;
          num_cars_next = num_cars - 1;
          end
      2'b11: begin
          next_state_Gate1 = Car_Out_Gate1;
          num_cars_next = num_cars;
          end
      endcase
      end
endcase
end
always@(*) begin
case(current_state_Gate2)
No_Car_Gate2: begin
    case({inout2_sensorA, inout2_sensorB}) 
        2'b00: begin
            next_state_Gate1 = No_Car_Gate2;
            num_cars_next = num_cars;
            end
        2'b01: begin
            next_state_Gate1 = Car_Out_Gate2;
            num_cars_next = num_cars;
            end
        2'b10: begin
            next_state_Gate1 = Car_In_Gate2;
            num_cars_next = num_cars;
            end
        2'b11: begin
            next_state_Gate1 = No_Car_Gate2;
            num_cars_next = num_cars;
            end
        endcase
        end
Car_In_Gate2: begin
    case({inout2_sensorA, inout2_sensorB}) 
       2'b00: begin
           next_state_Gate1 = No_Car_Gate2;
           num_cars_next = num_cars;
           end
       2'b01: begin
           next_state_Gate1 = No_Car_Gate2;
           num_cars_next = num_cars +1;
           end
       2'b10: begin
           next_state_Gate1 = Car_In_Gate2;
           num_cars_next = num_cars;
           end
       2'b11: begin
           next_state_Gate1 = Car_In_Gate2;
           num_cars_next = num_cars;
           end
       endcase
       end
Car_Out_Gate2: begin
  case({inout2_sensorA, inout2_sensorB}) 
      2'b00: begin
          next_state_Gate1 = No_Car_Gate2;
          num_cars_next = num_cars;
          end
      2'b01: begin
          next_state_Gate1 = Car_Out_Gate2;
          num_cars_next = num_cars;
          end
      2'b10: begin
          next_state_Gate1 = No_Car_Gate2;
          num_cars_next = num_cars - 1;
          end
      2'b11: begin
          next_state_Gate1 = Car_Out_Gate2;
          num_cars_next = num_cars;
          end
      endcase
      end
endcase
end
endmodule
