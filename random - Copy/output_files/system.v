module system(
input Clockv,
input Presetv,
output reg[4:0]Qv,
output [3:0] pv,
input [4:0]binv,
output reg[7:0]bcdv,
input [3:0]bcd1v,
output [6:0]segv
 );


 
 wire [3:0] ab;
 wire [7:0] bc;
 
random random1(
.CLOCK_50(Clockv), 
.Preset(Presetv),
.Q(ab),
.p(pv)
);	


Binary2BCD (
.bin(pv), 
.bcd(bc)
);





bcd_to_seven_seg btoseven(
.bcd(bc),
.seg(segv)
);




endmodule