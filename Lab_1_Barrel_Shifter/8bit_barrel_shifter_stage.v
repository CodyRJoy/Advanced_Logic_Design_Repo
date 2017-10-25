// Listing 3.19
module barrel_shifter_stage
   (
    input [7:0] SW,
    input BTNL,
    input BTNU,
    input BTNR,
    input BTNC,
    output [7:0] LED
   );

   // signal declaration
   wire [7:0] s0, s1, s2, s3;

   // body
   // stage 0, invert for left
   assign s0 = BTNC ? {SW[0],SW[1],SW[2],SW[3],SW[4],SW[5],SW[6],SW[7]} : SW;
   // stage 1, shift 0 or 1 bit
   assign s1 = BTNR ? {s0[0], s0[7:1]} : s0;
   // stage 2, shift 0 or 2 bits
   assign s2 = BTNU ? {s1[1:0] , s1[7:2]} : s1;
   // stage 3, shift 0 or 4 bits
   assign s3 = BTNL ? {s2[3:0], s2[7:4]} : s2;
   // stage 5, invert back for left
   assign LED = BTNC ? {s3[0],s3[1],s3[2],s3[3],s3[4],s3[5],s3[6],s3[7]} : s3;

endmodule
