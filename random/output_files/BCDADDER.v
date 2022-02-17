module BCDADDER(
    input [7:0] IN_A,
    input [7:0] IN_B,
    input CIN,
    output COUT,
    output [7:0] SUM
    );

reg [4:0] s2;

assign SUM = s2[3:0];
assign COUT = s2[4];

always @ ( * )
begin
    s2 = IN_A + IN_B + CIN;
    if (s2 > 9)
    begin
        s2 = s2 + 6;
    end
end
endmodule 