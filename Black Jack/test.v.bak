module fourbit_fulladder(Sum ,Cout , Cin , X ,Y);

output [3:0]Sum;
output  Cout;
input  Cin;
input  [3:0]X,Y;
wire C1,C2,C3;

FullAdder_m FA1(Sum[0],C1,X[0],Y[0],Cin);
FullAdder_m FA2(Sum[1],C2,X[1],Y[1],C1);
FullAdder_m FA3(.S(Sum[2]),.Cout(C3),.A(X[2]),.B(Y[2]),.Cin(C2));
FullAdder_m FA4(.S(Sum[3]),.Cout(Cout),.A(X[3]),.B(Y[3]),.Cin(C3));

endmodule