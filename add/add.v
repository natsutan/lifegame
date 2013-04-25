module add_top
  (
   input clk,
   input [8:0] neighbors,
   output reg result
   );
  
  reg [8:0]   neighbors_r;
  wire	      wdata;

  assign wdata  = is_live(neighbors_r);
  
  always @ (posedge clk) begin
    neighbors_r <= neighbors;
    result <= wdata;
  end

  function is_live;
    input [8:0] n;
    integer cnt;
    begin
      cnt = n[0] + n[1] + n[2] + n[3] + n[5] + n[6] + n[7] + n[8];
      if ( n[4] == 1 ) 
	is_live = (cnt == 2) || (cnt == 3);
      else 
	is_live = (cnt == 3);
    end
  endfunction 
  
endmodule // top




