`timescale 1ns / 1ps
module barrell_shifter_case_test;

    
 reg [15:0] sw;
 reg [4:0] shift;
 wire [15:0] led;
    
    barrel_shifter_stage_sim BSStage(
    
        .sw(sw),
        .shift(shift),
        .led(led)
    );
    
    initial
    begin
       sw <= 16'b0000000000000001;
       shift<= 0;
       #20;
       shift<= 1;
       #20;
        shift<= 2;
        #20;
        shift<= 3;
        #20;
        shift<= 4;
        #20;
        shift<= 5;
        #20;
        shift<= 6;
        #20;
        shift<= 7;
        #20;
        shift<= 8;
        #20;
        shift<= 9;
        #20;
        shift<= 10;
        #20;
        shift<= 11;
        #20;
        shift<= 12;
        #20;
        shift<= 13;
        #20;
        shift<= 14;
        #20;
        shift<= 15;
        #20;
       sw <= 16'b1111111111111110;
        shift<= 0;
        #20;
        shift<= 2;
        #20;
         shift<= 14;
         #20;
         shift<= 4;
         #20;
         shift<= 12;
         #20;
         shift<= 6;
         #20;
         shift<= 10;
         #20;
         shift<= 8;
         #20;
         shift<= 7;
         #20;
         shift<= 9;
         #20;
         shift<= 5;
         #20;
         shift<= 11;
         #20;
         shift<= 3;
         #20;
         shift<= 13;
         #20;
         shift<= 1;
         #20;
         shift<= 15;
         #20;
        sw <= 16'b1111110101010101;
         shift<= 0;
         #20;
         shift<= 15;
         #20;
          shift<= 14;
          #20;
          shift<= 13;
          #20;
          shift<= 12;
          #20;
          shift<= 11;
          #20;
          shift<= 10;
          #20;
          shift<= 9;
          #20;
          shift<= 8;
          #20;
          shift<= 7;
          #20;
          shift<= 6;
          #20;
          shift<= 5;
          #20;
          shift<= 4;
          #20;
          shift<= 3;
          #20;
          shift<= 2;
          #20;
          shift<= 1;
          #20;
       $finish;
    end
     

    
endmodule
