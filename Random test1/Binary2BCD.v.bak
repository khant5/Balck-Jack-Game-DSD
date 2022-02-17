module Binary2BCD (bin, bcd);
input [4:0] bin;
output [7:0] bcd;
reg [7:0] bcd;
reg [3:0] i;
always @(bin)
begin
bcd = 0;
for (i = 0; i<5; i = i+1) //repeat 5 times since binary has 5 bits
begin
bcd = {bcd[6:0],bin[4-i]}; //shift bcd number left once, with LSB from input binary #
if (i < 4 && bcd[3:0] >4 ) bcd [3:0] = bcd[3:0] +3; // add 3 to hex digit if it is more than 4.
if (i < 4 && bcd[7:4] >4 ) bcd [7:4] = bcd[7:4] +3;
end
end
endmodule
