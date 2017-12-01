`timescale 1ns / 1ps
module DHT22(

inout [3:1] JA,
input CLK100MHZ,
output LED16_G, 
output LED16_R,
output LED16_B

);



reg JA3in;
reg JA3out;
reg LEDR;
reg LEDG;
reg LEDB;
reg [7:0] state = 8'd0;
reg [31:0] count = 0;
reg [39:0] dataBits = 40'd0;
reg [7:0] bitCount = 8'd40;
reg dataReady;

initial begin
LEDR = 1'b0;
LEDG = 1'b0;
LEDB = 1'b0;

end

assign JA[3] = JA3out ? 1'b1: 1'b0;
assign LED16_R = LEDR;
assign LED16_G = LEDG;
assign LED16_B = LEDB;



always @(posedge CLK100MHZ) begin
	JA3in = JA[3];
end

always @(posedge CLK100MHZ) begin
	// Fail safe, resets the count and the state if we stall too long at any stage.
	if(count > 32'h3B9ACA00) begin
		count <= 32'h0;
		state <= 8'h00;
	end
	
	case (state)
		8'h00: begin // count to 5F5E100 (one second at 100 MHz) then move to next state;
			if(count < 32'h5F5E100) begin
				count <= count + 1;
				end
			else begin
				count <= 0;
				state <= 8'h01;
				end
			end
		8'h01: begin 	// send an output pulse lasting 1ms;
						// This is the 'start' signal to the device.
			if( count < 32'h186A0 ) begin
			     LEDB = 1'b1;
			     LEDR = 1'b0;
			     LEDG = 1'b0;
				count <= count + 1;
				JA3out <= 1'b0;
				end
			else begin
				count <= 0;
                JA3out <= 1'b1;
				state <= 8'h02;
				end
			end
		8'h02: begin // wait for our signal to achieve MARK AFTER START, allowing the bus to float high again.
			if (JA3in) begin
					count <= 0;
					state <= 8'h03; // MARK ACHIEVED,
				end
			else 
				count <= count +1;
			end
		8'h03: begin // wait for our signal to achieve SPACE AFTER MARK.
			if (~JA3in) begin
					count <= 0;
					state <= 8'h04; // SPACE ACHIEVED,
				end
			else 
				count <= count +1;
			end
		8'h04: begin // wait for bus to float high again, this is the last part of the ACK for our START command.
			if(JA3in) begin
				count <= 0;
				state <= 8'h05;
				dataReady <= 1'b0;
				bitCount <= 0;
				end
			else begin
				count <= count +1;
				end
			end
			
		// The following stages produce 40 bits of data.
		// each bit has a short low pulse, followed by a high pulse of 26-28uS for '0' or 70 us for '1'
		// so we loop from state 5 to 9, 40 times.
		8'h05: begin // as soon as we go low, rotate dataBits and move up-state to wait for high
			if (~JA3in) begin // Ensure start of bit transmission cycle has begun.
				LEDB = 1'b0;
				LEDR = 1'b1;
				count <= 0;
				state <= 8'h06;
				end
			else count <= count +1;
			end
		8'h06: begin
			if (JA3in) begin // wait here while 0, then move to state 7 as soon as we go high.
				state <= 8'h07;
				count <= 0;
				end
			else count <= count +1;
			end
		8'h07: begin // count how long we are high
			if (JA3in) begin
				count <= count +1;
				end
			else begin
				state <= 8'h08;
				end
			end
		8'h08: begin // we have gone low. Use the count to see if we received a count greater than of less than 50 us..
			if (count > 5000) begin
				count <= 0;
				dataBits[bitCount] = 1'b1;
				bitCount = bitCount + 1;
				state <= 8'h09;
				end
			else begin
				count <= 0;
				dataBits[bitCount] = 1'b0;
                bitCount = bitCount + 1;
				state <= 8'h09;
			end
			end
		8'h09: begin
			if(bitCount < 40) begin
				state <= 8'h05;
				end
			else begin
				dataReady <= 1'b1;
				state <= 8'h0a;
				end
			end
		8'h0a: begin // wait till we go high again, end of transmission
			if(JA3in) begin
			     if (dataBits[39:32] + dataBits[31:24] + dataBits[23:16] + dataBits[15:8] == dataBits[7:0]) begin
				    LEDR = 1'b0;
				    LEDG = 1'b1;
				    state <= 8'h00;
				    count <= 0;
				    // send data to be display on seven segment display
				 end
				 else begin
				 state <= 8'h00;
                 count <= 0;
                 //Don't send data to be display on seven segment display
                 end
             end
			else count <= count +1;
			end
		default: begin
			count <= 0;
			state <= 8'h00;
			end
	endcase
end

endmodule