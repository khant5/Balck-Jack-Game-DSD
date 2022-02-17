module bcd_to_seven_seg(bcd,segv,switch);

input [3:0]bcd;
reg[6:0]seg;
output reg[6:0]segv;
input switch;

always@(bcd)
begin
//if(switch==1)	
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