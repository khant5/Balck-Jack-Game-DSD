module random(CLOCK_50, Preset, Q,p);
input Preset;

input CLOCK_50;
output reg[3:0]Q;
reg[3:0]y;
output reg[3:0]p;

integer ii=0;
//output reg[3:0]L;

//.iCLK_50MHZ(CLOCK_50);



//Reset_Delay r0(	.iCLK(CLOCK_50),.oRESET(DLY_RST) );
//CLOCK_50=.iCLK_50MHZ(CLOCK_50);
	always
		
	
		begin
		if(Preset==1) y<=4'b1000;

	else 
		begin	
			
		
		
			begin
						
			
			
		
			y[3] = (Q[1]^Q[0]);
			y[2] = Q[3];
			y[1] = Q[2];
			y[0] = Q[1];
			
		
				if(y[3:0]<4'b1010) 
				begin
			p<=y;
			
		
				end
				  
			else if(y[3:0]==4'b01100) 
				begin
			p<=4'b0010;
			
		
				end
			else if(y[3:0]==4'b1011) 
				begin
				p<=4'b0011;
				end
			else if(y[3:0]==4'b1010) 
				begin
				p<=4'b0001;
				end
			else if(y[3:0]==4'b1101) 
				begin
				p<=4'b1001;
				end
			else if(y[3:0]==4'b1110) 
				begin
				p<=4'b0101;
				end
			else if(y[3:0]==4'b1111) 
				begin
				p<=4'b1000;
				end
			/*
			else if(y[4:0]==5'b10000) 
				begin
				p<=4'b1000;
				end
			else if(y[4:0]==5'b10001) 
				begin
				p<=4'b1001;
				end
			else if(y[4:0]==5'b10010) 
				begin
				p<=4'b0111;
				end
			else if(y[4:0]==5'b10011) 
				begin
				p<=4'b0010;
				end
			else if(y[4:0]==5'b10100) 
				begin
				p<=4'b0001;
				end
			else if(y[4:0]==5'b10101) 
				begin
				p<=4'b0100;
				end
			else if(y[4:0]==5'b10110) 
				begin
				p<=4'b1000;
				end
			else if(y[4:0]==5'b10111) 
				begin
				p<=4'b1001;
				end
			else if(y[4:0]==5'b11000) 
				begin
				p<=4'b0100;
				end
			else if(y[4:0]==5'b11001) 
				begin
				p<=4'b0001;
				end
			else if(y[4:0]==5'b11010) 
				begin
				p<=4'b0001;
				end
			else if(y[4:0]==5'b11011) 
				begin
				p<=4'b0010;
				end
			else if(y[4:0]==5'b11100) 
				begin
				p<=4'b1000;
				end
			else if(y[4:0]==5'b11101) 
				begin
				p<=4'b0001;
				end
			else if(y[4:0]==5'b11110) 
				begin
				p<=4'b0011;
				end
			else if(y[4:0]==5'b11111) 
				begin
				p<=4'b1001;
				end
		*/
		
			end
			
			
			
			
			
			
		end
	end

	
	
	

	always @(posedge CLOCK_50)
		begin
					Q[3:0]<=y[3:0];	
	
					
					p[3:0]<=p[3:0];
			
			
			
		
		end

	
endmodule


 








/*
if(y[3:0]==2'b1100)L[3:0]<=2'b0100;
			if(y[3:0]==2'b1011)L[3:0]<=2'b0011;
			if(y[3:0]==2'b1010)L[3:0]<=2'b0001;
			if(y[3:0]==2'b1101)L[3:0]<=2'b1001;

			if(y[3:0]==2'b1110)L[3:0]<=2'b1000;
			if(y[3:0]==2'b1111)L[3:0]<=2'b0111;
			*/