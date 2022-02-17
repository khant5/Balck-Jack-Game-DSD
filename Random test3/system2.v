module system2(
input Clockv,
input Presetv,
output reg[4:0]Qv,
output [3:0] pv,
input [4:0]binv,
output reg[7:0]bcdv,
input [3:0]bcd1v,
output [6:0]segv,

output [6:0]segv2,
output [3:0] pv2,

output [6:0]segv3,
output [6:0]segv4,

output [6:0]segv5,
output [6:0]segv6,

input [7:0] a8_inv, 
input [7:0] b8_inv,
input cin8_inv,
output [11:0] sum12_ouvt,
output [7:0] sum8_outv,
output cout8_outv,
output [3:0]av,
output [3:0]bv,
input addv
 );


 
 wire [3:0] ab;
 wire [7:0] bc;
 
  






  wire [3:0] ab2;
 wire [7:0] bc2;
 

  wire [3:0] av2;
  wire [3:0] bv2;

always @( posedge addv) 
 


begin

bcd_to_seven_seg(
.bcd(bc),
.seg(segv)
);

Binary2BCD (
.bin(pv2), 
.bcd(bc2)
);

random2(
.CLOCK_50(Clockv), 
.Preset(Presetv),
.Q(ab2),
.p(pv2)
);	

bcd_to_seven_seg(
.bcd(bc2),
.seg(segv2)
);

random(
.CLOCK_50(Clockv), 
.Preset(Presetv),
.Q(ab),
.p(pv)
);	


Binary2BCD (
.bin(pv), 
.bcd(bc)
);



bcd_to_seven_seg(
.bcd(av2),
.seg(segv3)
);

bcd_to_seven_seg(
.bcd(bv2),
.seg(segv4)
);
end 

//else 
always @(negedge addv) 
begin
bcdAdder(
	.a8_in(bc), 
	.b8_in(bc2),
	.cin8_in(cin8_inv),
	.sum12_out(sum12_ouvt),
	.cout8_out(cout8_outv),
	.a(av2),
	.b(bv2),
	.add(addv),
	.sum8_out(sum8_outv)
);

end


//end

/*
bcd_to_seven_seg add1(
.bcd(av2),
.seg(segv3)
);

bcd_to_seven_seg ad2(
.bcd(bv2),
.seg(segv4)
);
*/
/*
bcd_to_seven_seg (
.bcd(av2),
.seg(segv5)
);

bcd_to_seven_seg (
.bcd(bv2),
.seg(segv6)
);

*/



endmodule

