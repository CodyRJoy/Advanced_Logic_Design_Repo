`timescale 1ns / 1ps
module Parking_Lot#(parameter No_Car = 4'b0000, Car_In_G1 = 4'b0010, Car_In_G2 = 4'b1000, Car_Out_G1 = 4'b0001, Car_Out_G2 = 4'b0100,Car_In_Both = 4'b1010,  Car_Out_Both = 4'b0101, Car_In1_Out2 = 4'b0110, Car_In2_Out1 = 4'b1001, Wait = 4'b1111)(
input inout1_sensorA,
input inout1_sensorB,
input inout2_sensorA,
input inout2_sensorB,
input clk,
input rst,
output reg [1:0] num_cars,
output answer
    );
reg [2:0] current_state, next_state;
wire Total_num_cars;
reg num_cars_next;

initial num_cars = 2'b00;
 
 assign Total_num_cars = 4;
 
 always@(posedge clk or negedge rst)
 begin
 if(rst) begin
    current_state = No_Car;
    num_cars = 2'b00;
 end else begin
    current_state = next_state;
    num_cars = num_cars_next;
 end
 end
 
always@(posedge clk) 
begin
case(current_state)
No_Car: begin
    case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
        4'b0000: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        4'b0001: begin
            next_state = Car_Out_G1;
            num_cars_next = num_cars;
            end
        4'b0010: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        4'b0011: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        4'b0100: begin
            next_state = Car_Out_G2;
            num_cars_next = num_cars;
            end
        4'b0101: begin
            next_state = Car_Out_Both;
            num_cars_next = num_cars;
            end
        4'b0110: begin
            next_state = Car_In1_Out2;
            num_cars_next = num_cars;
            end
        4'b0111: begin
            next_state = Car_Out_G2;
            num_cars_next = num_cars;
            end
        4'b1000: begin
            next_state = Car_In_G2;
            num_cars_next = num_cars;
            end
        4'b1001: begin
            next_state = Car_In2_Out1;
            num_cars_next = num_cars;
            end
        4'b1010: begin
            next_state = Car_In_Both;
            num_cars_next = num_cars;
            end
        4'b1011: begin
            next_state = Car_In_G2;
            num_cars_next = num_cars;
            end
        4'b1100: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        4'b1101: begin
            next_state = Car_Out_G1;
            num_cars_next = num_cars;
            end
        4'b1110: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        4'b1111: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        endcase
        end
Car_In_G1: begin
    case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
        4'b0000: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        4'b0001: begin
            next_state = Wait;
            num_cars_next = num_cars+1;
            end
        4'b0010: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        4'b0011: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        4'b0100: begin
            next_state = Car_Out_G2;
            num_cars_next = num_cars;
            end
        4'b0101: begin
            next_state = Car_Out_G2;
            num_cars_next = num_cars+1;
            end
        4'b0110: begin
            next_state = Car_In1_Out2;
            num_cars_next = num_cars;
            end
        4'b0111: begin
            next_state = Car_In1_Out2;
            num_cars_next = num_cars;
            end
        4'b1000: begin
            next_state = Car_In_G2;
            num_cars_next = num_cars;
            end
        4'b1001: begin
            next_state = Car_In_G2;
            num_cars_next = num_cars+1;
            end
        4'b1010: begin
            next_state = Car_In_Both;
            num_cars_next = num_cars;
            end
        4'b1011: begin
            next_state = Car_In_Both;
            num_cars_next = num_cars;
            end
        4'b1100: begin
            next_state = No_Car;
            num_cars_next = num_cars;
            end
        4'b1101: begin
            next_state = Wait;
            num_cars_next = num_cars+1;
            end
        4'b1110: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        4'b1111: begin
            next_state = Car_In_G1;
            num_cars_next = num_cars;
            end
        endcase
        end
Car_In_G2: begin
        case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
            4'b0000: begin
                next_state = No_Car;
                num_cars_next = num_cars;
                end
            4'b0001: begin
                next_state = Car_Out_G1;
                num_cars_next = num_cars;
                end
            4'b0010: begin
                next_state = Car_In_G1;
                num_cars_next = num_cars;
                end
            4'b0011: begin
                next_state = No_Car;
                num_cars_next = num_cars;
                end
            4'b0100: begin
                next_state = Wait;
                num_cars_next = num_cars + 1;
                end
            4'b0101: begin
                next_state = Car_Out_G1;
                num_cars_next = num_cars +1;
                end
            4'b0110: begin
                next_state = Car_In_G1;
                num_cars_next = num_cars+1;
                end
            4'b0111: begin
                next_state = Wait;
                num_cars_next = num_cars+1;
                end
            4'b1000: begin
                next_state = Car_In_G2;
                num_cars_next = num_cars;
                end
            4'b1001: begin
                next_state = Car_In2_Out1;
                num_cars_next = num_cars;
                end
            4'b1010: begin
                next_state = Car_In_Both;
                num_cars_next = num_cars;
                end
            4'b1011: begin
                next_state = Car_In_G2;
                num_cars_next = num_cars;
                end
            4'b1100: begin
                next_state = Car_In_G2;
                num_cars_next = num_cars;
                end
            4'b1101: begin
                next_state = Car_In2_Out1;
                num_cars_next = num_cars;
                end
            4'b1110: begin
                next_state = Car_In_Both;
                num_cars_next = num_cars;
                end
            4'b1111: begin
                next_state = Car_In_G2 ;
                num_cars_next = num_cars;
                end
            endcase
            end
Car_Out_G1: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b0010: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b0011: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b0101: begin
                    next_state = Car_Out_Both;
                    num_cars_next = num_cars;
                    end
                4'b0110: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars-1;
                    end
                4'b0111: begin
                    next_state = Car_Out_Both;
                    num_cars_next = num_cars;
                    end
                4'b1000: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars;
                    end
                4'b1001: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                4'b1010: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars-1;
                    end
                4'b1011: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                4'b1100: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b1110: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b1111: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                endcase
                end
Car_Out_G2: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b0010: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars;
                    end
                4'b0011: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b0101: begin
                    next_state = Car_Out_Both;
                    num_cars_next = num_cars;
                    end
                4'b0110: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                4'b0111: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b1000: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b1001: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars-1;
                    end
                4'b1010: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars-1;
                    end
                4'b1011: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b1100: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Car_Out_Both;
                    num_cars_next = num_cars;
                    end
                4'b1110: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                4'b1111: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                endcase
                end
Car_In_Both: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Wait;
                    num_cars_next = num_cars+1;
                    end
                4'b0010: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars;
                    end
                4'b0011: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Wait;
                    num_cars_next = num_cars+1;
                    end
                4'b0101: begin
                    next_state = Wait;
                    num_cars_next = num_cars+2;
                    end
                4'b0110: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars+1;
                    end
                4'b0111: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars+1;
                    end
                4'b1000: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars;
                    end
                4'b1001: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars+1;
                    end
                4'b1010: begin
                    next_state = Car_In_Both;
                    num_cars_next = num_cars;
                    end
                4'b1011: begin
                    next_state = Car_In_Both;
                    num_cars_next = num_cars;
                    end
                4'b1100: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars+1;
                    end
                4'b1110: begin
                    next_state = Car_In_Both;
                    num_cars_next = num_cars;
                    end
                4'b1111: begin
                    next_state = Car_In_Both;
                    num_cars_next = num_cars;
                    end
                endcase
                end
Car_Out_Both: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                    4'b0000: begin
                        next_state = No_Car;
                        num_cars_next = num_cars;
                        end
                    4'b0001: begin
                        next_state = Car_Out_G1;
                        num_cars_next = num_cars;
                        end
                    4'b0010: begin
                        next_state = Wait;
                        num_cars_next = num_cars-1;
                        end
                    4'b0011: begin
                        next_state = Car_Out_G1;
                        num_cars_next = num_cars;
                        end
                    4'b0100: begin
                        next_state = Car_Out_G2;
                        num_cars_next = num_cars;
                        end
                    4'b0101: begin
                        next_state = Car_Out_Both;
                        num_cars_next = num_cars;
                        end
                    4'b0110: begin
                        next_state = Car_Out_G2;
                        num_cars_next = num_cars-1;
                        end
                    4'b0111: begin
                        next_state = Car_Out_Both;
                        num_cars_next = num_cars;
                        end
                    4'b1000: begin
                        next_state = Wait;
                        num_cars_next = num_cars-1;
                        end
                    4'b1001: begin
                        next_state = Car_Out_G1;
                        num_cars_next = num_cars-1;
                        end
                    4'b1010: begin
                        next_state = Wait;
                        num_cars_next = num_cars-2;
                        end
                    4'b1011: begin
                        next_state = Car_In_G1;
                        num_cars_next = num_cars-1;
                        end
                    4'b1100: begin
                        next_state = Car_Out_G2;
                        num_cars_next = num_cars;
                        end
                    4'b1101: begin
                        next_state = Car_Out_Both;
                        num_cars_next = num_cars;
                        end
                    4'b1110: begin
                        next_state = Car_In_G2;
                        num_cars_next = num_cars-1;
                        end
                    4'b1111: begin
                        next_state = Car_Out_Both;
                        num_cars_next = num_cars;
                        end
                    endcase
                    end
Car_In1_Out2: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Wait;
                    num_cars_next = num_cars+1;
                    end
                4'b0010: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars;
                    end
                4'b0011: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b0101: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars+1;
                    end
                4'b0110: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                4'b0111: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                4'b1000: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b1001: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1010: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars-1;
                    end
                4'b1011: begin
                    next_state = Car_In_G1;
                    num_cars_next = num_cars-1;
                    end
                4'b1100: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Car_Out_G2;
                    num_cars_next = num_cars+1;
                    end
                4'b1110: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                4'b1111: begin
                    next_state = Car_In1_Out2;
                    num_cars_next = num_cars;
                    end
                endcase
                end
Car_In2_Out1: begin
            case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b0010: begin
                    next_state = Wait;
                    num_cars_next = num_cars-1;
                    end
                4'b0011: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Wait;
                    num_cars_next = num_cars+1;
                    end
                4'b0101: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars+1;
                    end
                4'b0110: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0111: begin
                    next_state = Car_Out_G1;
                    num_cars_next = num_cars+1;
                    end
                4'b1000: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars;
                    end
                4'b1001: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                4'b1010: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars-1;
                    end
                4'b1011: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                4'b1100: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                4'b1110: begin
                    next_state = Car_In_G2;
                    num_cars_next = num_cars-1;
                    end
                4'b1111: begin
                    next_state = Car_In2_Out1;
                    num_cars_next = num_cars;
                    end
                endcase
                end
Wait: begin
        case({inout2_sensorA, inout1_sensorB,inout1_sensorA, inout1_sensorB}) 
                4'b0000: begin
                    next_state = No_Car;
                    num_cars_next = num_cars;
                    end
                4'b0001: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0010: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0011: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0100: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0101: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0110: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b0111: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1000: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1001: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1010: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1011: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1100: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1101: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1110: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                4'b1111: begin
                    next_state = Wait;
                    num_cars_next = num_cars;
                    end
                endcase
                end
    endcase
    end
endmodule
