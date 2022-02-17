module lfsrtest1(
  input clk,
  input rst_n,

  output reg [3:0] data
);

reg [3:0] data_next;

always @* begin

  data_next[3] = data[1]^data[0];
  data_next[2] = data[3];
  data_next[1] = data[2];
  data_next[0] = data[1];
end

always @(posedge clk or negedge rst_n)
  if(!rst_n)
    data <= 4'h1f;
  else
    data <= data_next;

endmodule