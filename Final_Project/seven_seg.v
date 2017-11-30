`timescale 1ns / 1ps
module seven_seg(
    input CLK100MHZ, // 100 Mhz clock source on Basys 3 FPGA
    input CPU_RESETN, // reset
    input [15:0] SW,
    output reg [3:0] AN, // anode signals of the 7-segment LED display
    output reg CA,CB,CC,CD,CE,CF,CG// cathode patterns of the 7-segment LED display
    );
    reg [3:0] LED_BCD;
    reg [27:0] disp_counter; 
    
    initial begin
    
    disp_counter = 0;
    
    end
    
    always @(posedge CLK100MHZ or posedge CPU_RESETN)
    begin if(CPU_RESETN ==1)begin
            disp_counter = 0;
        end else begin
            disp_counter = disp_counter +1;
        end
        
        if (disp_counter ==49999)
        begin
            AN = 4'b1110; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = {SW[3],SW[2],SW[1],SW[0]};
            // the first digit of the 16-bit number
            disp_counter = 0;
          end
          else if (disp_counter == 12499) begin
            AN = 4'b1101; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = {SW[7],SW[6],SW[5],SW[4]};
            // the second digit of the 16-bit number
            end
        else if (disp_counter == 24999)begin
            AN = 4'b1011; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = {SW[11],SW[10],SW[9],SW[8]};
            // the third digit of the 16-bit number
                end
        else if (disp_counter == 37499) begin
            AN = 4'b0111; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = {SW[15],SW[14],SW[13],SW[12]};
            // the fourth digit of the 16-bit number    
           end
    end
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(LED_BCD)
		0:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0000001;
        1:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b1001111;
        2:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0010010;
        3:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0000110;
        4:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b1001100;
        5:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0100100;
        6:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0100000;
        7:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0001111;
        8:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0000000;
        9:       {CA,CB,CC,CD,CE,CF,CG} <= 7'b0001100;
        10:      {CA,CB,CC,CD,CE,CF,CG} <= 7'b0001000;
        11:      {CA,CB,CC,CD,CE,CF,CG} <= 7'b1100000;
        12:      {CA,CB,CC,CD,CE,CF,CG} <= 7'b0110001;
        13:      {CA,CB,CC,CD,CE,CF,CG} <= 7'b1000010;
        14:      {CA,CB,CC,CD,CE,CF,CG} <= 7'b0110000;
        default: {CA,CB,CC,CD,CE,CF,CG} <= 7'b0111000;
        endcase
    end
 endmodule