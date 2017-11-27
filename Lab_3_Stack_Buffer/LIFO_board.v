// Listing 4.20
module Lifo_board
   #(
    parameter B=3, // number of bits in a word
              W=2  // number of address bits
   )
   (
   input CPU_RESETN,
   input CLK100MHZ,
   input BTNL,
   input BTNR,
   input [2:0] SW,
   output [7:0] LED 
   );

   //signal declaration
   wire clk, reset;
   wire rd, wr;
   wire [B-1:0] w_data;
   wire empty, full;
   wire [B-1:0] r_data;
   reg [B-1:0] array_reg [2**W-1:0];  // register array
   reg [W-1:0] ptr_reg, ptr_next;
   reg [W-1:0] ptr_prev, ptr_succ;
   reg full_reg, empty_reg, full_next, empty_next;
   wire wr_en;
   assign clk = CLK100MHZ;
   assign reset = CPU_RESETN;
   assign rd = BTNL;
   assign wr = BTNR;
   assign w_data[2:0] = SW[2:0];
   

   // body
   // register file write operation
   always @(posedge clk)
      if (wr_en)
         array_reg[ptr_reg] <= w_data;
   // register file read operation
   assign r_data = array_reg[ptr_reg];
   // write enabled only when FIFO is not full
   assign wr_en = wr & ~full_reg;

   // fifo control logic
   // register for read and write pointers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            ptr_reg <= 3;
            full_reg <= 1'b0;
            empty_reg <= 1'b1;
         end
      else
         begin
            ptr_reg <= ptr_next;
            full_reg <= full_next;
            empty_reg <= empty_next;
         end

   // next-state logic for read and write pointers
   always @*
   begin
      // successive pointer values
      ptr_succ = ptr_reg - 1;
      ptr_prev = ptr_reg + 1;
      // default: keep old values
      ptr_next = ptr_reg;
      full_next = full_reg;
      empty_next = empty_reg;
      case ({wr, rd})
         // 2'b00:  no op
         2'b01: // read
            if (~empty_reg) // not empty
               begin
                  ptr_next = ptr_prev;
                  full_next = 1'b0;
                  if (ptr_next==3)
                     empty_next = 1'b1;
               end
         2'b10: // write
            if (~full_reg) // not full
               begin
                  ptr_next = ptr_succ;
                  empty_next = 1'b0;
                  if (ptr_next==0)
                     full_next = 1'b1;
               end
         2'b11: // write and read
            begin
               ptr_next = ptr_reg;
            end
      endcase
   end

   // output
   assign full = full_reg;
   assign empty = empty_reg;
   assign LED[7] = full;
   assign LED[6] = empty;
   assign LED[5:3] = 3'b000;
   assign LED[2:0] = r_data;

endmodule

