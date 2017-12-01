`timescale 1ns / 1ps
module seven_seg(
 input CLK100MHZ, CPU_RESETN,
 input [15:0] SW, 
 output CA,CB,CC,CD,CE,CF,CG,DP, 
 output [3:0] AN
 );


reg [19:0]count; 
reg [3:0] SW_Choose;
reg [3:0] AN_Choose; //register for the 4 bit enable
reg [6:0] Num_Choose; // 7 bit register to hold the binary value of each input given

always @ (posedge CLK100MHZ or posedge CPU_RESETN)
 begin
  if (~CPU_RESETN)
   count <= 0;
  else
   count <= count + 1;
 end

always @ (*)
 begin
  case(count[19:18]) //using only the 2 MSB's of the counter 
   
   2'b00 :  //When the 2 MSB's are 00 enable the fourth display
    begin
     SW_Choose = {SW[3],SW[2],SW[1],SW[0]};
     AN_Choose = 4'b1110;
    end
   
   2'b01:  //When the 2 MSB's are 01 enable the third display
    begin
     SW_Choose = {SW[7],SW[6],SW[5],SW[4]};
     AN_Choose = 4'b1101;
    end
   
   2'b10:  //When the 2 MSB's are 10 enable the second display
    begin
     SW_Choose = {SW[11],SW[10],SW[9],SW[8]};
     AN_Choose = 4'b1011;
    end
    
   2'b11:  //When the 2 MSB's are 11 enable the first display
    begin
     SW_Choose = {SW[15],SW[14],SW[13],SW[12]};
     AN_Choose = 4'b0111;
    end
  endcase
 end


always @ (*)
 begin
  case(SW_Choose)
    0:       Num_Choose <= 7'b0000001;
    1:       Num_Choose <= 7'b1001111;
    2:       Num_Choose <= 7'b0010010;
    3:       Num_Choose <= 7'b0000110;
    4:       Num_Choose <= 7'b1001100;
    5:       Num_Choose <= 7'b0100100;
    6:       Num_Choose <= 7'b0100000;
    7:       Num_Choose <= 7'b0001111;
    8:       Num_Choose <= 7'b0000000;
    9:       Num_Choose <= 7'b0001100;
    10:      Num_Choose <= 7'b0001000;
    11:      Num_Choose <= 7'b1100000;
    12:      Num_Choose <= 7'b0110001;
    13:      Num_Choose <= 7'b1000010;
    14:      Num_Choose <= 7'b0110000;
    default: Num_Choose <= 7'b0111000;
  endcase
 end
assign {CA,CB,CC,CD,CE,CF,CG} = Num_Choose;
assign AN = AN_Choose;
assign DP = 1'b1;


endmodule