module bcd_to_seven_seg(bcd,switch,seg,sego);

input [3:0]bcd;
output reg[6:0]sego;
output reg[6:0] seg;
input switch;

//always @(posedge switch)

//begin

	always@(bcd)
	begin
	
	case(bcd)
	0:sego=7'b1000000;
	1:sego=7'b1111001;
	2:sego=7'b0100100;
	3:sego=7'b0110000;
	4:sego=7'b0011001;
	5:sego=7'b0010010;	
	6:sego=7'b0000010;
	7:sego=7'b1011000;
	8:sego=7'b0000000;
	9:sego=7'b0010000;
	endcase 
	
	end
	
	
	always @(posedge switch)
	begin
	seg<=sego;
	end
	
//end
//end
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