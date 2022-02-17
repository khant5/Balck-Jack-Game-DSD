//BCD to seven segement display based on one random number
module bcd_to_seven_seg(bcd,segv,switch);
//Declarations of inputs and outputs
input [3:0]bcd;
reg[6:0]seg;
output reg[6:0]segv;
input switch;

always@(*)
begin
//Based on bcd number it would display the corresponding number
//on the seven-segment-display
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
// Seven-segment display would display a one if the switch is on
// Otherwise the seven-segment display would not light up 
if(switch==1)
begin
	segv=seg;
	//break;
end
else
begin

segv=7'b1111111;
end
end

endmodule

