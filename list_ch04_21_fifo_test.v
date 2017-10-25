// Listing 4.21
module fifo_test
   (
    input wire clk, CPU_RESETN,
    input wire BTNR,BTNL,
    input wire [2:0] SW,
    output wire [7:0] LED
   );

   // signal declaration
   wire [1:0] db_btn;

   // debounce circuit for btn[0]
   debounce btn_db_unit0
      (.clk(clk), .reset(CPU_RESETN), .sw(BTNL),
       .db_level(), .db_tick(db_btn[0]));
   // debounce circuit for btn[1]
   debounce btn_db_unit1
      (.clk(clk), .reset(CPU_RESETN), .sw(BTNR),
       .db_level(), .db_tick(db_btn[1]));
   // instantiate a 2^2-by-3 fifo
   fifo #(.B(3), .W(2)) fifo_unit
      (.clk(clk), .reset(reset),
      .rd(db_btn[0]), .wr(db_btn[1]), .w_data(SW),
      .r_data(LED[2:0]), .full(LED[7]), .empty(LED[6]));
   // disable unused leds
   assign LED[5:3] = 3'b000;

 endmodule

