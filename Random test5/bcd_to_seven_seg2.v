
module bcd_to_seven_seg2(bcd,bcd2,segv,switch,switch2);

input [3:0]bcd;
input [3:0]bcd2;
reg[6:0]seg;
output reg[6:0]segv;
//output reg[6:0]segv2;
input switch;
input switch2;

//always 
//begin

always @(*)
begin


	if(switch2==1)
	begin	
	case(bcd2)
	0:seg=7'b1000000;
	1:seg=7'b1111001;
	2:seg=7'b0100100;
	3:segv=7'b0110000;
	4:seg=7'b0011001;
	5:seg=7'b0010010;	
	6:seg=7'b0000010;
	7:seg=7'b1011000;
	8:seg=7'b0000000;
	9:seg=7'b0010000;
	endcase 
	
if(switch==1)
begin
	segv=seg;
	//break;
end
else if(switch2==0)
begin
//seg=7'b1111111;	
segv=7'b1111111;
end	
	end
	
	else
	begin	
	case(bcd)
	0:seg=7'b1000000;
	1:seg=7'b1111001;
	2:seg=7'b0100100;
	3:seg=7'b0110000;
	4:seg=7'b0011001;
	5:seg=7'b0010010;	
	6:seg=7'b0000010;
	7:seg=7'b1011000;
	8:seg=7'b0000000;
	9:seg=7'b0010000;
	endcase 
	
if(switch==1)
begin
	segv=seg;
	//break;
end
else
begin
//seg=7'b1111111;	
segv=7'b1111111;
end
	

	end
	
	
end
endmodule

	/*
	0:seg=7'b1111111;
		1:seg=7'b1111001;
		2:seg=7'b0100100;
		3:seg=7'b0110000;
		4:seg=7'b0011001;
		5:seg=7'b0010010;	
		6:seg=7'b0000010;
		7:seg=7'b1011000;
		8:seg=7'b0000000;
		9:seg=7'b0010000;
		*/