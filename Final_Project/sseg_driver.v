`timescale 1ns / 1ps
module sseg_driver(
    input [3:0] SW,
    output [1:0] AN,
    output CA,
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG,
    output DP
    );
    reg [6:0] sseg;
    reg [3:0] num;
	assign DP = 1;
	assign AN[0] = 0;
	assign AN[1] = 1;
	
	always@* begin
		case({SW[3], SW[2],SW[1], SW[0]})
		0:       sseg <= 7'b0000001;
		1:       sseg <= 7'b1001111;
		2:       sseg <= 7'b0010010;
		3:       sseg <= 7'b0000110;
		4:       sseg <= 7'b1001100;
		5:       sseg <= 7'b0100100;
		6:       sseg <= 7'b0100000;
		7:       sseg <= 7'b0001111;
		8:       sseg <= 7'b0000000;
		9:       sseg <= 7'b0001100;
		10:      sseg <= 7'b0001000;
		11:      sseg <= 7'b1100000;
		12:      sseg <= 7'b0110001;
		13:      sseg <= 7'b1000010;
		14:      sseg <= 7'b0110000;
		default: sseg <= 7'b0111000;
		endcase
		
	end
	assign {CA,CB,CC,CD,CE,CF,CG} = sseg;
endmodule
