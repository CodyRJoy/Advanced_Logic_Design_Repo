`timescale 1ns / 1ps
module seven_seg(
 input CLK100MHZ, CPU_RESETN,
 input [15:0] RH_Value, 
 input [15:0] Temp_Value,
 output CA,CB,CC,CD,CE,CF,CG,DP, 
 output [7:0] AN
 );


reg [19:0]count; 
reg [3:0] SW_Choose;
reg [7:0] AN_Choose; //register for the 4 bit enable
reg [6:0] Num_Choose; // 7 bit register to hold the binary value of each input given

always @ (posedge CLK100MHZ or posedge CPU_RESETN)
 begin
  if (CPU_RESETN)
   count <= 0;
  else
   count <= count + 1;
 end

always @ (*)
 begin
  case(count[19:17]) //using only the 2 MSB's of the counter 
   
   3'b000 :  //When the 2 MSB's are 00 enable the eighth display
    begin
     SW_Choose = {RH_Value[3],RH_Value[2],RH_Value[1],RH_Value[0]};
     AN_Choose = 8'b11111110;
    end
   
   3'b001:  //When the 2 MSB's are 01 enable the seventh display
    begin
     SW_Choose = {RH_Value[7],RH_Value[6],RH_Value[5],RH_Value[4]};
     AN_Choose = 8'b11111101;
    end
   
   3'b010:  //When the 2 MSB's are 10 enable the sixth display
    begin
     SW_Choose = {RH_Value[11],RH_Value[10],RH_Value[9],RH_Value[8]};
     AN_Choose = 8'b11111011;
    end
    
   3'b011:  //When the 2 MSB's are 11 enable the fifth display
    begin
     SW_Choose = {RH_Value[15],RH_Value[14],RH_Value[13],RH_Value[12]};
     AN_Choose =8'b11110111;
    end
     3'b100 :  //When the 2 MSB's are 00 enable the fourth display
     begin
      SW_Choose = {Temp_Value[3],Temp_Value[2],Temp_Value[1],Temp_Value[0]};
      AN_Choose = 8'b11101111;
     end
    
    3'b101:  //When the 2 MSB's are 01 enable the third display
     begin
      SW_Choose = {Temp_Value[7],Temp_Value[6],Temp_Value[5],Temp_Value[4]};
      AN_Choose = 8'b11011111;
     end
    
    3'b110:  //When the 2 MSB's are 10 enable the second display
     begin
      SW_Choose = {Temp_Value[11],Temp_Value[10],Temp_Value[9],Temp_Value[8]};
      AN_Choose = 8'b10111111;
     end
     
    3'b111:  //When the 2 MSB's are 11 enable the first display
     begin
      SW_Choose = {Temp_Value[15],Temp_Value[14],Temp_Value[13],Temp_Value[12]};
      AN_Choose = 8'b01111111;
     end
  endcase
 end


always @ (*)
 begin
 if (AN_Choose == 8'b01111111)
   case(SW_Choose)
   0:       Num_Choose <= 7'b0000001;
   1:       Num_Choose <= 7'b1001111;
   2:       Num_Choose <= 7'b0010010;
   3:       Num_Choose <= 7'b0000110;
   4:       Num_Choose <= 7'b1001100;
   5:       Num_Choose <= 7'b0100100;
   6:       Num_Choose <= 7'b0100000;
   7:       Num_Choose <= 7'b0001111;
   default: Num_Choose <= 7'b1111110;
 endcase
 
 else
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
assign {CG, CF, CE, CD, CC, CB, CA} = Num_Choose;
assign AN = AN_Choose;
assign DP = 1'b1;


endmodule
