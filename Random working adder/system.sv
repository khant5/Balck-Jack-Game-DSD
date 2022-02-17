	module system(
input Clockd,
input Clockv,
input Presetv,
output reg[4:0]Qv,
output [3:0] pv,
input [4:0]binv,
output reg[7:0]bcdv,
input [3:0]bcd1v,
output [6:0]segv,
output [6:0]segv1,
output [6:0]segv2,
output [6:0]segvv2,
output [3:0] pv2,
output [3:0] pv3,
output [6:0]segv3,
output [6:0]segv4,

output [6:0]segv5,
output [6:0]segv6,

input [7:0] a8_inv, 
input [7:0] b8_inv,
input cin8_inv,
output [11:0] sum12_ouvt,
output [7:0] sum8_outv,
output [11:0] sum12_ouvtv2,
output [7:0] sum8_outv2,
output cout8_outv,
output [3:0]av,
output [3:0]bv,
input addv,
input switch,
input switch2,
input switch3,
input sw4
 );


 
 wire [3:0] ab;
 wire [7:0] bc;
 /*
 always 
 begin
	if(switch==1)
	begin
	segv3=segv;
	segv4=segv2;
	end
	else
	begin
	segv=segv;
	segv2=segv;
	end
 
 end

 */



Binary2BCD (
.bin(pv), 
.bcd(bc)
);






  wire [3:0] ab2;
 wire [7:0] bc2;
 
 random random1(
.switch(switch),
.CLOCK_50(cout), 
.Preset(Presetv),
.Q(ab),
.p(pv),

);	
 
random2 random2(
.switch(switch),
.CLOCK_50(coutd), 
.Preset(Presetv),
.Q(ab2),
.p(pv2)
);	


random3 random3(
.switch(switch3),
.CLOCK_50(cout), 
.Preset(Presetv),
.Q(ab3),
.p(pv3)
);	



Binary2BCD (
.bin(pv2), 
.bcd(bc2)
);
 wire [3:0] ab3;
 wire [7:0] bc3;

Binary2BCD (
.bin(pv3), 
.bcd(bc3)
);


/*
bcd_to_seven_seg2 hex6(
.bcd(bc),
//.seg(segv),
.bcd2(av2),//
.segv(segv),
//.segv2(segv3),//
.switch(switch),
.switch2(addv)
);

*/
/*
bcd_to_seven_seg hex6(
.bcd(bc),
//.seg(segv),
.segv(segv),
.switch(switch)
);
*/
/*
bcd_to_seven_seg hex5(
.bcd(bc),
//.seg(segv),
.segv(segv),
.switch(switch)
);

*/



bcd_to_seven_seg hex5(
.bcd(bc3),
//.seg(segv),
.segv(segv3),
.switch(switch3)
);

/*before
bcd_to_seven_seg2 hex6(
.bcd(bc),
//.seg(segv),
.bcd2(av2),//
.segv(segv),
//.segv2(),//
.switch(switch),
.switch2(addv)
);

*/
/////////////////
bcd_to_seven_seg2 hex6(
.bcd(bc),
//.seg(segv),
.bcd2(av2),//
.bcd3(av3),///
.segv(segv),
//.segv2(),//
.switch(switch),
.switch2(addv),
.switch3(sw4)///
);

/////////////////////////////

bcd_to_seven_seg2 hex7(
.bcd(bc2),
//.seg(segv),
.bcd2(bv2),//
.bcd3(bv3),///
.segv(segv2),
//.segv2(),//
.switch(switch),
.switch2(addv),
.switch3(sw4)///
);
//////////////////////////////
/*before
bcd_to_seven_seg2 hex7(
.bcd(bc2),
//.seg(segv),
.bcd2(bv2),//
.segv(segv2),
//.segv2(),//
.switch(switch),
.switch2(addv)
);
*/

/*
bcd_to_seven_seg hex7(
.bcd(bc2),
//.seg(segv2),
.segv(segv2),
.switch(switch)
);
*/


  wire [3:0] av2;
  wire [3:0] bv2;
  
  wire [3:0] av3;
  wire [3:0] bv3;
  
/*
bcd_to_seven_seg hex2(
.bcd(av2),
.segv(segv3),
.switch(addv)
);

bcd_to_seven_seg hex3(
.bcd(bv2),
.segv(segv4),
.switch(addv)
);
*/

wire [7:0] sum8_outv3;
wire [7:0] sum8_outv4;

bcdAdder(
	.a8_in(bc), 
	.b8_in(bc2),
	.cin8_in(cin8_inv),
	.sum12_out(sum12_ouvt),
	.cout8_out(cout8_outv),
	.a(av2),
	.b(bv2),
	.add(addv),
	.sum8_out(sum8_outv3)
);
assign sum8_outv4=sum8_outv3;//-7'b0000010;//+7'b0000010;
//sum8_outv2=sum8_outv2+1;
bcdAdder2 add(
	.a8_in(sum8_outv3), 
	.b8_in(bc3),
	.cin8_in(cin8_inv),
	.sum12_out(sum12_ouvtv2),
	.cout8_out(sum8_ouvtv2),
	.a(av3),
	.b(bv3),
	.add(switch3),
	.sum8_out(sum8_outv2)
);

/*
bcd_to_seven_seg (
.bcd(av2),
.segv(segv5)
);

bcd_to_seven_seg (
.bcd(bv2),
.segv(segv6)
);
*/

	reg [24:0] counter;
	reg [24:0] counterd;
	reg cout;
	reg coutd;
initial begin

counter=0;
cout=0;
end

always @(posedge Clockv)

begin
	if(counter==0)
	begin	counter<=24999999;
	cout<=~cout;
	
	end
	else
	begin	counter<=counter-1;
	end
end
	
always @(posedge Clockd)

begin
	if(counterd==0)
	begin	counterd<=(24999999/2);
	coutd<=~coutd;
	end
	else
	begin	counterd<=counterd-1;
	end
end


endmodule

