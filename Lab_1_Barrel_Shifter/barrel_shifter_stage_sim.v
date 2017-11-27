// Listing 3.19
module barrel_shifter_stage_sim
   (
    input [15:0] sw,
    input [4:0] shift,
    output [15:0] led
   );

   // signal declaration
   wire [15:0] s0, s1, s2, s3, s4;
   wire btnc,btnr,btnu,btnl,btnd;
   assign {btnc,btnd,btnl,btnu,btnr} = shift;

   // body
   // stage 0, invert for left
   assign s0 = btnc ? {sw[0],sw[1],sw[2],sw[3],sw[4],sw[5],sw[6],sw[7],sw[8],sw[9],sw[10],sw[11],sw[12],sw[13],sw[14],sw[15]} : sw;
   // stage 1, shift 0 or 1 bit
   assign s1 = btnr ? {s0[0], s0[15:1]} : s0;
   // stage 2, shift 0 or 2 bits
   assign s2 = btnu ? {s1[1:0] , s1[15:2]} : s1;
   // stage 3, shift 0 or 4 bits
   assign s3 = btnl ? {s2[3:0], s2[15:4]} : s2;
   // stage 4, shift 0 or 4 bits
   assign s4 = btnd ? {s3[7:0], s3[15:8]} : s3;
   // stage 5, invert back for left
   assign led = btnc ? {s4[0],s4[1],s4[2],s4[3],s4[4],s4[5],s4[6],s4[7],s4[8],s4[9],s4[10],s4[11],s4[12],s4[13],s4[14],s4[15]} : s4;

endmodule