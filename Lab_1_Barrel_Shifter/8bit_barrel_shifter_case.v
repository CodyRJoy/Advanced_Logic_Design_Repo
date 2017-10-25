// Listing 3.18
module barrel_shifter_case
   (
     input [7:0] SW,
     input BTNL,
     input BTNR,
     input BTNU,
     input BTNC,
     output reg [7:0] LED
    );

   // body
   always @* begin
      case({BTNC,BTNL,BTNU,BTNR})
         4'b0000: LED = SW;
         4'b0001: LED = {SW[0], SW[7:1]};
         4'b0010: LED = {SW[1:0], SW[7:2]};
         4'b0011: LED = {SW[2:0], SW[7:3]};
         4'b0100: LED = {SW[3:0], SW[7:4]};
         4'b0101: LED = {SW[4:0], SW[7:5]};
         4'b0110: LED = {SW[5:0], SW[7:6]};
         4'b0111: LED = {SW[6:0], SW[7]};
         4'b1000: LED = SW;
         4'b1001:LED = {SW[6:0], SW[7]};
         4'b1010:LED = {SW[5:0], SW[7:6]};
         4'b1011:LED = {SW[4:0], SW[7:5]};
         4'b1100:LED = {SW[3:0], SW[7:4]};
         4'b1101:LED = {SW[2:0], SW[7:3]};
         4'b1110:LED = {SW[1:0], SW[7:2]};
         default: LED = {SW[0], SW[7:1]};
      endcase
end

endmodule
