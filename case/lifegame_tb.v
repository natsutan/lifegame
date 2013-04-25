module top_tb();

  reg clk;
  reg [8:0] neighbors;
  wire 	    result_case;
  wire      result_rom;
  wire 	    result_add;
  
  parameter PERIOD = 10.0;

  case_top u0
  (
    .clk(clk),
    .neighbors(neighbors),
    .result(result_case)
   );

  case_top u1
  (
    .clk(clk),
    .neighbors(neighbors),
    .result(result_rom)
   );

  add_top u2
  (
    .clk(clk),
    .neighbors(neighbors),
    .result(result_add)
   );
  
  always # (PERIOD/2) clk = ~clk;


  initial begin
    
    #1 clk = 1; neighbors = 0;

    while (neighbors != 9'b111111111) begin
      #(PERIOD) neighbors = neighbors + 1;
    end
    
    #100 $finish;
  end
  
endmodule // top_tb
