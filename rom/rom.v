module rom_top
  (
   input clk,
   input [8:0] neighbors,
   output reg result
   );
  
  reg [8:0]   neighbors_r;
  wire	      wdata;
  
  always @ (posedge clk) begin
    result <= wdata;
  end

  arom arom 
    (
     .address(neighbors),
     .clock(clk),
     .q(wdata)
     );

endmodule // top
