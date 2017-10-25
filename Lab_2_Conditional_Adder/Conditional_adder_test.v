`timescale 1ns / 1ps

module Conditional_adder_test;

parameter bits = 8;
reg [bits-1:0] xreg;
reg [bits-1:0] yreg;
//reg creg;
reg modereg;
wire [8:0] answerwire;
//wire [1:0] rwire;

Conditional_Adder#() Conditional_Adder_1(
    .x(xreg),
    .y(yreg),
    //.cin(creg),
    .mode(modereg),
    //.testanswer(testanswerwire),
    .answer(answerwire)
    //.r(rwire)
    );
    
initial begin

xreg <= 15;
yreg <= 1;
//creg <= 1;
modereg <= 0;
//cinreg <= 0;
#10;

end
    
endmodule

