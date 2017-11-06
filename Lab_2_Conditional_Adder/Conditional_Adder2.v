`timescale 1ns / 1ps

module Conditional_Adder2#(parameter bits=8, levels=4)(
    input [7:0] x,
    input [7:0] y,
    input mode,
    output [7:0] sum,
    output cout
    );
    
    wire[15:0] HAres;
    wire[15:0] FAres;
    wire [1:0] resnc00;
    wire [1:0] resnc01;
    wire [1:0] resnc02;
    wire [1:0] resnc03;
    wire [1:0] resnc04;
    wire [1:0] resnc05;
    wire [1:0] resnc06;
    wire [1:0] resnc07;
    wire [1:0] reswc00;
    wire [1:0] reswc01;
    wire [1:0] reswc02;
    wire [1:0] reswc03;
    wire [1:0] reswc04;
    wire [1:0] reswc05;
    wire [1:0] reswc06;
    wire [1:0] reswc07;
    wire [1:0] tempnc00;
    wire [1:0] tempnc01;
    wire [1:0] tempnc02;
    wire [1:0] tempnc03;
    wire [1:0] tempwc00;
    wire [1:0] tempwc01;
    wire [1:0] tempwc02;
    wire [1:0] tempwc03;
    wire [2:0] resnc10;
    wire [2:0] resnc11;
    wire [2:0] resnc12;
    wire [2:0] resnc13;
    wire [2:0] reswc10;
    wire [2:0] reswc11;
    wire [2:0] reswc12;
    wire [2:0] reswc13;
    wire [2:0] tempnc10;
    wire [2:0] tempnc11;
    wire [2:0] tempwc10;
    wire [2:0] tempwc11;
    wire [4:0] resnc20;
    wire [4:0] resnc21;
    wire [4:0] reswc20;
    wire [4:0] reswc21;
    wire [4:0] tempnc20;
    wire [4:0] tempwc20;
    wire [8:0] resnc30;
    wire [8:0] reswc30;
    
    wire [7:0] yt;    
    assign yt[0] = y[0]^mode;
    assign yt[1] = y[1]^mode;
    assign yt[2] = y[2]^mode;
    assign yt[3] = y[3]^mode;
    assign yt[4] = y[4]^mode;
    assign yt[5] = y[5]^mode;
    assign yt[6] = y[6]^mode;
    assign yt[7] = y[7]^mode;
    
    HA1 sumnocarry(.x(x), .y(yt), .r(HAres));
    FA1 sumwithcarry(.x(x), .y(yt),.cin(1),.r(FAres));
    
    assign resnc00 = HAres[1:0];
    assign resnc01 = HAres[3:2];
    assign resnc02 = HAres[5:4];
    assign resnc03 = HAres[7:6];
    assign resnc04 = HAres[9:8];
    assign resnc05 = HAres[11:10];
    assign resnc06 = HAres[13:12];
    assign resnc07 = HAres[15:14];
    assign reswc00 = FAres[1:0];
    assign reswc01 = FAres[3:2];
    assign reswc02 = FAres[5:4];
    assign reswc03 = FAres[7:6];
    assign reswc04 = FAres[9:8];
    assign reswc05 = FAres[11:10];
    assign reswc06 = FAres[13:12];
    assign reswc07 = FAres[15:14];
       
    assign tempnc00 = resnc00[1]?reswc01:resnc01;
    assign resnc10 = {tempnc00,resnc00[0]};
    assign tempwc00 = reswc00[1]?reswc01:resnc01;
    assign reswc10 = {tempwc00,reswc00[0]};
    assign tempnc01 = resnc02[1]?reswc03:resnc03;
    assign resnc11 = {tempnc01,resnc02[0]};
    assign tempwc01 = reswc02[1]?reswc03:resnc03;
    assign reswc11 = {tempwc01,reswc02[0]};
    assign tempnc02 = resnc04[1]?reswc05:resnc05;
    assign resnc12 = {tempnc02,resnc04[0]};
    assign tempwc02 = reswc04[1]?reswc05:resnc05;
    assign reswc12 = {tempwc02,reswc04[0]};
    assign tempnc03 = resnc06[1]?reswc07:resnc07;
    assign resnc13 = {tempnc03,resnc06[0]};
    assign tempwc03 = reswc06[1]?reswc07:resnc07;
    assign reswc13 = {tempwc03,reswc06[0]};
    assign tempnc10 = resnc10[2]?reswc11:resnc11;
    assign resnc20 = {tempnc10,resnc10[1:0]};
    assign tempwc10 = reswc10[2]?reswc11:resnc11;
    assign reswc20 = {tempwc10,reswc10[1:0]};
    assign tempnc11 = resnc12[2]?reswc13:resnc13;
    assign resnc21 = {tempnc11,resnc12[1:0]};
    assign tempwc11 = reswc12[2]?reswc13:resnc13;
    assign reswc21 = {tempwc11,reswc12[1:0]};
    assign tempnc20 = resnc20[4]?reswc21:resnc21;
    assign resnc30 = {tempnc20,resnc20[3:0]};
    assign tempwc20 = reswc20[4]?reswc21:resnc21;
    assign reswc30 = {tempwc20,reswc20[3:0]};
    assign sum[7:0] = mode?reswc30[7:0]:resnc30[7:0];
    assign cout = mode?reswc30[8]:resnc30[8];
 
   
endmodule
