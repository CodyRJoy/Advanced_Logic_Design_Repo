// Listing 3.19
module barrel_shifter_stage
   (
    input [15:0] SW,
    input BTNL,
    input BTNU,
    input BTNR,
    input BTND,
    input BTNC,
    output [15:0] LED
   );

   // signal declaration
   wire [15:0] s0, s1, s2, s3, s4;

   // body
   // stage 0, invert for left
   assign s0 = BTNC ? {SW[0],SW[1],SW[2],SW[3],SW[4],SW[5],SW[6],SW[7],SW[8],SW[9],SW[10],SW[11],SW[12],SW[13],SW[14],SW[15]} : SW;
   // stage 1, shift 0 or 1 bit
   assign s1 = BTNR ? {s0[0], s0[15:1]} : s0;
   // stage 2, shift 0 or 2 bits
   assign s2 = BTNU ? {s1[1:0] , s1[15:2]} : s1;
   // stage 3, shift 0 or 4 bits
   assign s3 = BTNL ? {s2[3:0], s2[15:4]} : s2;
   // stage 4, shift 0 or 4 bits
   assign s4 = BTND ? {s3[7:0], s3[15:8]} : s3;
   // stage 5, invert back for left
   assign LED = BTNC ? {s4[0],s4[1],s4[2],s4[3],s4[4],s4[5],s4[6],s4[7],s4[8],s4[9],s4[10],s4[11],s4[12],s4[13],s4[14],s4[15]} : s4;

endmodule
