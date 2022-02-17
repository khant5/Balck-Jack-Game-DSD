module LFSR (Preset, Clock,Q);
input Preset;
input Clock;
output reg[3:0]Q;
reg[3:0]y;

always
	begin 
	if(Preset==1)y<=3'b111;
	else	
		begin
		y[3]<=(Q[1]^Q[0]);
		y[2]<=Q[3];
		y[1]<=Q[2];
		y[0]<=Q[1];
		end
	end
	
	always @(posedge Clock)
	begin	
		Q[3]<=y[3];
		Q[2]<=y[2];
		Q[1]<=y[1];
		Q[0]<=y[0];
		end
endmodule