// Main module used to connect other modules
module system(
input Clockd,
input Clockv,
input Presetv,

output reg[4:0]Qv,
output [3:0] pv,


output [6:0]segv,
output [6:0]segv1,
output [6:0]segv2,
output [3:0] pv2,
output [3:0] pv3,
output [6:0]segv3,
output [6:0]segv4,

output [6:0]segv5,
output [6:0]segv6,

output [6:0]Hex1,
output [6:0]Hex2,
input cin8_inv,
output [11:0] sum12_ouvt,
output [7:0] sum8_outv,
output [11:0] sum12_ouvtv2,
output [11:0] sum12_ouvtv5,
output [7:0] sum8_ouvtv5,
output [7:0] sum8_outv2,
output cout8_outv,
output [3:0]av,
output [3:0]bv,
input addv,
input switch,
input switch2,
input switch3,
input sw4,
input sw5,
/////////////////////////
output [6:0]segvv2,
output [6:0]segv1v2,
output [6:0]segv2v2,
output [3:0] pv2v2,
output [3:0] pv3v2,
output [3:0] pvv2,
output [6:0]segv3v2,
output [6:0]segv4v2,

output [6:0]segv5v2,
output [6:0]segv6v2,



input cin8_invv2,
output [11:0] sum12_ouvtvv2,
output [7:0] sum8_outvv2,
output [11:0] sum12_ouvtv2v2,
output [11:0] sum12_ouvtv5v2,
output [7:0] sum8_ouvtv5v2,
output [7:0] sum8_outv2v2,
output cout8_outvv2,
output [3:0]avv2,
output [3:0]bvv2,
input addvv2,
input switchv2,
input switch2v2,
input switch3v2,
input sw4v2,
input sw5v2

 );


 
 wire [3:0] ab;
 wire [7:0] bc;



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
.p(pv)

);	
 
random2 random2(
.switch(switch),
.CLOCK_50(coutd), 
.Preset(Presetv),
.p(pv2)
);	


random3 random3(
.switch(switch3),
.CLOCK_50(cout), 
.Preset(Presetv),
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

bcd_to_seven_seg hex5(
.bcd(bc3),
.segv(segv3),
.switch(switch3)
);


/////////////////
bcd_to_seven_seg2 hex6(
.bcd(bc),
//.seg(segv),
.bcd2(av2),//
.bcd3(av3),///
.bcd4(av4),
.segv(segv),
//.segv2(),//
.switch(switch),
.switch2(addv),
.switch3(sw4),///
.switch4(sw5)
);

/////////////////////////////

bcd_to_seven_seg2 hex7(
.bcd(bc2),
//.seg(segv),
.bcd2(bv2),//
.bcd3(bv3),///
.bcd4(bv4),
.segv(segv2),
//.segv2(),//
.switch(switch),
.switch2(addv),
.switch3(sw4),///
.switch4(sw5)
);
//////////////////////////////
//start of next segements for player 2


  wire [3:0] av2;
  wire [3:0] bv2;
  
  wire [3:0] av3;
  wire [3:0] bv3;
  
  wire [3:0] av4;
  wire [3:0] bv4;


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
	//.switch()
	.sum8_out(sum8_outv3)
);

wire [7:0] sum8_outv5;
assign sum8_outv4=sum8_outv3;

bcdAdder2 add(
	.a8_in(sum8_outv3), 
	.b8_in(bc3),
	.cin8_in(cin8_inv),
	.sum12_out(sum12_ouvtv2),
	.cout8_out(sum8_ouvtv2),
	.a(av3),
	.b(bv3),
	.add(switch3),
	.sum8_out(sum8_outv5)
);




//////////////////////////////
 wire [3:0] abv2;
 wire [7:0] bcv2;
 
  wire [3:0] ab2v2;
 wire [7:0] bc2v2;

  wire [3:0] av2v2;
  wire [3:0] bv2v2;
  
  wire [3:0] av3v2;
  wire [3:0] bv3v2;
  
  wire [3:0] av4v2;
  wire [3:0] bv4v2;
  
 wire [7:0] bc3v2;
  wire [7:0] sum8_outv3v2;

	wire [3:0] ab3v2;

random6 (
.switch(switchv2),
.CLOCK_50(cout), 
.Preset(Presetv),
.p(pvv2)
);	
 

 
 
random2 random2v2(
.switch(switchv2),
.CLOCK_50(coutd), 
.Preset(Presetv),
.p(pv2v2)
);	


random3 random3v2(
.switch(switch3v2),
.CLOCK_50(cout), 
.Preset(Presetv),
.p(pv3v2)
);	

Binary2BCD (
.bin(pvv2), 
.bcd(bcv2)
);


Binary2BCD (
.bin(pv2v2), 
.bcd(bc2v2)
);


Binary2BCD (
.bin(pv3v2), 
.bcd(bc3v2)
);


bcd_to_seven_seg hex4(
.bcd(bc3v2),
//.seg(segv),
.segv(segv3v2),
.switch(switch3v2)
);

bcd_to_seven_seg2 hex3(
.bcd(bcv2),
//.seg(segv),
.bcd2(av2v2),//
.bcd3(av3v2),///
.bcd4(av4v2),
.segv(segvv2),

.switch(switchv2),
.switch2(addvv2),
.switch3(sw4v2),///
.switch4(sw5v2)
);

bcd_to_seven_seg2 hex2(
.bcd(bc2v2),

.bcd2(bv2v2),//
.bcd3(bv3v2),///
.bcd4(bv4v2),
.segv(segv2v2),

.switch(switchv2),
.switch2(addvv2),
.switch3(sw4v2),///
.switch4(sw5v2)
);



bcdAdder(
	.a8_in(bcv2), 
	.b8_in(bc2v2),
	.cin8_in(cin8_invv2),
	.sum12_out(sum12_ouvtvv2),
	.cout8_out(cout8_outvv2),
	.a(av2v2),
	.b(bv2v2),
	.add(addvv2),

	.sum8_out(sum8_outv3v2)
);



bcdAdder2 addv2(
	.a8_in(sum8_outv3v2), 
	.b8_in(bc3v2),
	.cin8_in(cin8_invv2),
	.sum12_out(sum12_ouvtv2v2),
	.cout8_out(sum8_ouvtv2v2),
	.a(av3v2),
	.b(bv3v2),
	.add(switch3v2),
	.sum8_out(sum8_outv5v2)
);

wire [3:0]bin;
assign bin=4'b1100;
wire [3:0]bin2;
assign bin2=4'b10011;
wire [7:0]bina;
wire [7:0]binb;
///////////////////////

Binary2BCD (
.bin(bin), 
.bcd(bina)
);
Binary2BCD (
.bin(bin2), 
.bcd(binb)
);
wire [7:0] cin8_invv8;
wire [7:0] sum8_outv8;
wire [11:0]sum12_ouvtvv8;
wire [7:0] cout8_outvv8;
wire [3:0]av2v8;
wire [3:0]bv2v8;
bcdAdder(
	.a8_in(bina), 
	.b8_in(binb),
	.cin8_in(cin8_invv8),
	.sum12_out(sum12_ouvtvv8),
	.cout8_out(cout8_outvv8),
	.a(av2v8),
	.b(bv2v8),
	.add(addvv8),
	//.switch()
	.sum8_out(sum8_outv8)
);


always @(posedge Clockv)//&&(sum12_ouvtv2<sum12_ouvtv2v2) )||(sum12_ouvtv2>sum12_ouvtv2v2) //&&(sum12_ouvtv2>sum12_ouvtv2v2) )||(sum12_ouvtv2v2>sum12_ouvtv2)
 

begin
	if((sum12_ouvtv2>sum12_ouvtv2v2) && ((addv==1)&& (switch==1)&& (switch3==1)&& (sw4==1) && (addvv2==1)&& (switchv2==1)&& (switch3v2==1)&& (sw4v2==1)))
	begin
	

	Hex2=7'b1111111;
	Hex1=7'b1111001;
	
	end
	else if((sum12_ouvtv2v2>sum12_ouvtv2) && ((addv==1)&& (switch==1)&& (switch3==1)&& (sw4==1) && (addvv2==1)&& (switchv2==1)&& (switch3v2==1)&& (sw4v2==1)))
	begin	

	Hex1=7'b1111111; 
	Hex2=7'b0100100;
	end
	
	else
	begin
	Hex2=7'b1111111;
	Hex1=7'b1111111;
	end
end




	reg [24:0] counter;
	reg [24:0] counterd;
	reg cout;
	reg coutd;
initial begin

counter=0;
cout=0;
end
//Clocl slowed down 
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

