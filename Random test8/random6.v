module random6(switch,CLOCK_50, Preset,p);
//decleration of inputs and outputs
input Preset;
input CLOCK_50;
reg[3:0]Q;
reg[3:0]y;
//P vector used as output to test waveforms in quartus
//Also used to test LEDs when seven segement display was not implemented yet
output reg[3:0]p;
input switch;


always
begin
//Start the sequence when preset equals 1
//random generator start at sequncce 4'b0111, because it needs to start other than state zero.
if(Preset==1) y<=4'b0111;
//if switch equals zero continue sequenc other wise stop if switch is one		
else if(switch==0)
begin	
			
		
		
	begin
//Linear feed back shift register with first two bit having an XOR						
	y[3] = (Q[1]^Q[0]);
	y[2] = Q[3];
	y[1] = Q[2];
	y[0] = Q[1];
			
//Stats at state less then 2'd10
	
		if(y[3:0]<4'b1010) 
		begin
		p<=y;	
		end
//State 4'b01100 is now equal to state 4'b0010		  
		else if(y[3:0]==4'b01100) 
		begin
		p<=4'b0010;
		end
//State 4'b1011 is now equal to state 4'b0011			
		else if(y[3:0]==4'b1011) 
		begin
		p<=4'b0011;
		end
//State 4'b1010 is now equal to state 4'b0001			
			
		else if(y[3:0]==4'b1010) 
		begin
		p<=4'b0001;
		end
//State 4'b1101 is now equal to state 4'b1001			
			
		else if(y[3:0]==4'b1101) 
		begin
		p<=4'b1001;
		end
//State 4'b1110 is now equal to state 4'b0101			
		
		else if(y[3:0]==4'b1110) 
		begin
		p<=4'b0101;
		end
//State 4'b1111 is now equal to state 4'b1000			
			
		else if(y[3:0]==4'b1111) 
		begin
		p<=4'b1000;
		end
	end

end

end

	
	
	
//Starts at positive edge of clock 
// Q vector is equal to y vector
//p vector is equal to itslef always at the positive edge
// equal to it self to start


always @(posedge CLOCK_50)
begin

Q[3:0]<=y[3:0];		
p[3:0]<=p[3:0];
			

end

endmodule


 







