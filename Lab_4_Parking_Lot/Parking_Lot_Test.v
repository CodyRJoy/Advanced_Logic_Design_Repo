`timescale 1ns / 1ps
module Parking_Lot_Test;

reg creg;
reg rreg;
reg inout1_sensorAreg;
reg inout1_sensorBreg;
reg inout2_sensorAreg;
reg inout2_sensorBreg;
wire [1:0] num_cars_wire;

Parking_Lot#() Parking_Lot1(
    .clk(creg),
    .rst(rreg),
    .inout1_sensorA(inout1_sensorAreg),
    .inout1_sensorB(inout1_sensorBreg),
    .inout2_sensorA(inout2_sensorAreg),
    .inout2_sensorB(inout2_sensorBreg),
    .num_cars(num_cars_wire)
    );
 initial begin
     creg = 0;
     forever #10 creg = ~creg;
 end   
initial begin

inout1_sensorAreg <= 0;
inout1_sensorBreg <= 0;
inout2_sensorAreg <= 0;
inout2_sensorBreg <= 0;
rreg<=1;
#100;
inout1_sensorAreg <= 1;
rreg<=0;
#100;
inout1_sensorBreg <= 1;
#100;
inout1_sensorAreg <= 0;
#100;
inout1_sensorBreg <= 0;
#100;
inout1_sensorBreg <= 1;
#100;
inout1_sensorAreg <= 1;
#100;
inout1_sensorBreg <= 0;
#100;
inout1_sensorAreg <= 0;
#100;
$finish;

end
    
endmodule
