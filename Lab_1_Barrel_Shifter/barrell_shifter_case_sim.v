// Listing 3.18
module barrel_shifter_case_sim
   (
     input [15:0] sw,
     input [4:0] shift,
     output reg [15:0] led
    );

   // body
   always @* begin
      case(shift)
         5'b00000: led = sw;
         5'b00001: led = {sw[0], sw[15:1]};
         5'b00010: led = {sw[1:0], sw[15:2]};
         5'b00011: led = {sw[2:0], sw[15:3]};
         5'b00100: led = {sw[3:0], sw[15:4]};
         5'b00101: led = {sw[4:0], sw[15:5]};
         5'b00110: led = {sw[5:0], sw[15:6]};
         5'b00111: led = {sw[6:0], sw[15:7]};
         5'b01000: led = {sw[7:0], sw[15:8]};
         5'b01001: led = {sw[8:0], sw[15:9]};
         5'b01010: led = {sw[9:0], sw[15:10]};
         5'b01011: led = {sw[10:0], sw[15:11]};
         5'b01100: led = {sw[11:0], sw[15:12]};
         5'b01101: led = {sw[12:0], sw[15:13]};
         5'b01110: led = {sw[13:0], sw[15:14]};
         5'b01111: led = {sw[14:0], sw[15]};
         5'b10000: led = sw;
         5'b10001:led = {sw[14:0], sw[15]};
         5'b10010:led = {sw[13:0], sw[15:14]};
         5'b10011:led = {sw[12:0], sw[15:13]};
         5'b10100:led = {sw[11:0], sw[15:12]};
         5'b10101:led = {sw[10:0], sw[15:11]};
         5'b10110:led = {sw[9:0], sw[15:10]};
         5'b10111:led = {sw[8:0], sw[15:9]};
         5'b11000:led = {sw[7:0], sw[15:8]};
         5'b11001:led = {sw[6:0], sw[15:7]};
         5'b11010:led = {sw[5:0], sw[15:6]};
         5'b11011:led = {sw[4:0], sw[15:5]};
         5'b11100:led = {sw[3:0], sw[15:4]};
         5'b11101:led = {sw[2:0], sw[15:3]};
         5'b11110:led = {sw[1:0], sw[15:2]};
         default: led = {sw[0], sw[15:1]};
      endcase
end

endmodule