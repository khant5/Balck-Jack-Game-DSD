/*
module clock(CLOCK_50);
	input Clockv;
	
	reg [24:0] counter;
	reg cout;
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
	
	 
endmodule 	  */