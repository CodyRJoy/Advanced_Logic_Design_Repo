`timescale 1ns / 1ps

module Conditional_adder_test;

parameter bits = 8;
reg [bits-1:0] xreg;
reg [bits-1:0] yreg;
reg modereg;
wire [7:0] sumwire;
wire cwire;

Conditional_Adder2#() Conditional_Adder_1(
    .x(xreg),
    .y(yreg),
    .mode(modereg),
    .sum(sumwire),
    .cout(cwire)
    );
    
initial begin

xreg <= 127;
yreg <= 1;
modereg <= 0;
#100;
xreg <= 128;
yreg <= 127;
modereg <= 1;
#100;
xreg <= 255;
yreg <= 0;
modereg <= 0;
#100;
modereg <= 1;
#100;
xreg <= 117;
yreg <= 85;
modereg <= 0;
#100;
modereg <= 1;
#100;
xreg <= 119;
yreg <= 57;
modereg <= 0;
#100;
modereg <= 1;
#100;
$finish;

end
    
endmodule

