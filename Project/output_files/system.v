module system(
input Clockv,
input Clockv2,
input Presetv,
output reg[4:0]Qv,
output [3:0] pv,
output [3:0] pv2,
input [4:0]binv,
output reg[7:0]bcdv,


output [6:0]segv,

input [3:0]bcd1v,
output [6:0]segv2
/*
output [6:0]segv3

 input [7:0] IN_Av,
 input [7:0] IN_Bv,
 input CINv,
 output COUTv,
 output [7:0] SUMv
 */
 );


 
 wire [3:0] ab;
 wire [7:0] bc;
 wire [3:0] ab2;
 wire [7:0] bc2;
 
random random1(
.CLOCK_50(Clockv), 
.Preset(Presetv),
.Q(ab),
.p(pv)
);	

random2 random2(
.CLOCK_50(Clockv2), 
.Preset(Presetv),
.Q(ab2),
.p(pv2)
);	

Binary2BCD  (
.bin(pv), 
.bcd(bc)
);
Binary2BCD  (
.bin(pv2), 
.bcd(bc2)
);




bcd_to_seven_seg btoseven(
.bcd(bc),
.seg(segv)
);

bcd_to_seven_seg (
.bcd(bc2),
.seg(segv2)
);
/*
wire [7:0] add;
BCDADDER(
   .IN_A(bc),
   .IN_B(bc2),
   .CIN(CINv),
   .COUT(COUTv),
   .SUM(add)
    );

bcd_to_seven_seg (
.bcd(add),
.seg(segv3)
);
*/
endmodule