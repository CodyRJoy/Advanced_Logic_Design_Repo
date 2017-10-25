// Listing 3.18
module barrel_shifter_case
   (
     input [15:0] SW,
     input BTNL,
     input BTND,
     input BTNR,
     input BTNU,
     input BTNC,
     output reg [15:0] LED
    );

   // body
   always @* begin
      case({BTNC,BTND,BTNL,BTNU,BTNR})
         5'b00000: LED = SW;
         5'b00001: LED = {SW[0], SW[15:1]};
         5'b00010: LED = {SW[1:0], SW[15:2]};
         5'b00011: LED = {SW[2:0], SW[15:3]};
         5'b00100: LED = {SW[3:0], SW[15:4]};
         5'b00101: LED = {SW[4:0], SW[15:5]};
         5'b00110: LED = {SW[5:0], SW[15:6]};
         5'b00111: LED = {SW[6:0], SW[15:7]};
         5'b01000: LED = {SW[7:0], SW[15:8]};
         5'b01001: LED = {SW[8:0], SW[15:9]};
         5'b01010: LED = {SW[9:0], SW[15:10]};
         5'b01011: LED = {SW[10:0], SW[15:11]};
         5'b01100: LED = {SW[11:0], SW[15:12]};
         5'b01101: LED = {SW[12:0], SW[15:13]};
         5'b01110: LED = {SW[13:0], SW[15:14]};
         5'b01111: LED = {SW[14:0], SW[15]};
         5'b10000: LED = SW;
         5'b10001:LED = {SW[14:0], SW[15]};
         5'b10010:LED = {SW[13:0], SW[15:14]};
         5'b10011:LED = {SW[12:0], SW[15:13]};
         5'b10100:LED = {SW[11:0], SW[15:12]};
         5'b10101:LED = {SW[10:0], SW[15:11]};
         5'b10110:LED = {SW[9:0], SW[15:10]};
         5'b10111:LED = {SW[8:0], SW[15:9]};
         5'b11000:LED = {SW[7:0], SW[15:8]};
         5'b11001:LED = {SW[6:0], SW[15:7]};
         5'b11010:LED = {SW[5:0], SW[15:6]};
         5'b11011:LED = {SW[4:0], SW[15:5]};
         5'b11100:LED = {SW[3:0], SW[15:4]};
         5'b11101:LED = {SW[2:0], SW[15:3]};
         5'b11110:LED = {SW[1:0], SW[15:2]};
         default: LED = {SW[0], SW[15:1]};
      endcase
end

endmodule
