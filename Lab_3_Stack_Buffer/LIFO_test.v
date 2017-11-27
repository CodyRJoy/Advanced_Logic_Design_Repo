// Listing 4.21
module Lifo_test;
   
    //input wire clk, CPU_RESETN,
    //input wire BTNR,BTNL,
    //input wire [3:0] SW,
    //output wire [7:0] LED
    reg clk;
    reg reset;
    reg rd;
    reg wr;
    reg [2:0] w_data;
    wire [2:0] r_data;
    wire full;
    wire empty;
    

   // signal declaration
   //wire [1:0] db_btn;

   // debounce circuit for btn[0]
   //debounce btn_db_unit0
   //   (.clk(clk), .reset(CPU_RESETN), .sw(BTNL),
   //    .db_level(), .db_tick(db_btn[0]));
   // debounce circuit for btn[1]
   //debounce btn_db_unit1
   //   (.clk(clk), .reset(CPU_RESETN), .sw(BTNR),
   //    .db_level(), .db_tick(db_btn[1]));
   // instantiate a 2^2-by-3 fifo
   Lifo #(.B(3), .W(2)) Lifo_unit
      (.clk(clk), .reset(reset),
      .rd(rd), .wr(wr), .w_data(w_data),
      .r_data(r_data), .full(full), .empty(empty));
   // disable unused leds
   
   
    initial begin
  
    // Initialize Inputs
  
    w_data  = 4'h0;
  
    rd  = 1'b0;
  
    wr  = 1'b0;
  
    reset  = 1'b1;
  
    clk  = 1'b0;
  
    #100;      
    reset     = 1'b0;
    #100;
    rd = 1'b1;
    #20;
    rd =1'b0;
    wr      = 1'b1;
  
    w_data  = 4'h0;
  
    #20;
  
    w_data = 4'h2;
  
    #20;
  
    w_data = 4'h4;
  
    #20;
  
    w_data = 4'h6;
  
    #20;
  
    rd  = 1'b1;
    wr = 1'b0;
    #100;
    wr = 1'b1;
    #100;
    $finish;
  
   end 
  
     always #10 clk = ~clk;

 endmodule

