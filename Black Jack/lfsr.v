
module lfsr(
out             ,  // Output of the counter
enable          ,  // Enable  for counter
clk             ,  // clock input
reset           //,   // reset input
//data
);

//----------Output Ports--------------
output [3:0] out;
//------------Input Ports--------------
//input [3:0] data;
input enable, clk, reset;
//------------Internal Variables--------
reg [3:0] out;
wire        linear_feedback;

//-------------Code Starts Here-------
assign linear_feedback = (out[0] ^ out[1]);
//out[0]= linear_feedback;
always @(posedge clk)
if (reset) 
begin // active high reset
  out =4'b1;
end 
else if (enable) 
begin
  out <= {out[3],out[2],

          out[1], out[0]};
end 

endmodule // End Of Module co