
//LCD display in DE2-115
// The following code initializes the LCD display in DE2-115 FPGA board  and displays “EGC320” on the first line and “Project” on the second line of the LCD display */
/*
module LCD_Dispaly (CLK, RST, RS, E, RW, DATA, ON);   //LCD Module 16X2
input CLK, RST;//	50 MHz clock
output RW;// LCD Read/Write Select, 0 = Write, 1 = Read
output E;// LCD Enable
output RS;// LCD Command/Data Select, 0 = Command, 1 = Data
output ON;
input [7:0] DATA;
parameter [3:0]  
HOLD = 4'h0,
FUNC_SET = 4'h1,
DISPLAY_ON = 4'h2,
MODE_SET = 4'h3,
Print_String = 4'h4,
LINE2 = 4'h5,
RETURN_HOME = 4'h6,
DROP_LCD_E = 4'h7,
RESET1 = 4'h8,
RESET2 = 4'h9,
RESET3 = 4'ha,
DISPLAY_OFF = 4'hb,
DISPLAY_CLEAR = 4'hc;

reg [3:0] state, next_command; //enter new ASCII hex data above for DISPLAY
reg [7:0] DATA_BUS_VALUE;
wire [7:0] Next_Char;
reg [19:0] CLK_COUNT_400HZ;
reg [4:0] CHAR_COUNT;
reg CLK_400HZ, LCD_RW_INT, E, RS;

assign ON = 1'b1;//Turn on LCD
assign RW = LCD_RW_INT; 
assign  DATA = LCD_RW_INT ?    8'bzzzzzzzz : DATA_BUS_VALUE;

LCD_String u1 (CHAR_COUNT,  Next_Char);

always @ (posedge CLK , negedge RST)
if (!RST) begin
CLK_COUNT_400HZ <= 20'h0;
CLK_400HZ <= 1'b0;
     	 end
else if (CLK_COUNT_400HZ < 20'h0F424)        CLK_COUNT_400HZ <=  CLK_COUNT_400HZ + 1;
      else begin
CLK_COUNT_400HZ <= 20'h0;
CLK_400HZ <= ~CLK_400HZ;
     	 end

//State machine to send commands and data 

always @ (posedge CLK_400HZ, negedge RST)
if (!RST) state <= RESET1;
else 

case (state)

RESET1:  begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h38;
state <= DROP_LCD_E;
next_command <= RESET2;
CHAR_COUNT <= 5'b0;
end

RESET2: begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h38;
state <= DROP_LCD_E;
next_command <= RESET3;
end

RESET3: begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h38;
state <= DROP_LCD_E;
next_command <= FUNC_SET;
end

FUNC_SET: begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h38;
state <= DROP_LCD_E;
next_command <= DISPLAY_OFF;
end
DISPLAY_OFF : begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h08;
state <= DROP_LCD_E;
next_command <= DISPLAY_CLEAR;
end
DISPLAY_CLEAR : begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h01;
state <= DROP_LCD_E;
next_command <= DISPLAY_ON;
end

DISPLAY_ON : begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h0C;
state <= DROP_LCD_E;
next_command <= MODE_SET;
end

MODE_SET: begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h06;
state <= DROP_LCD_E;
next_command <= Print_String;
end

Print_String: begin 
E <= 1'b1;
RS <= 1'b1;
LCD_RW_INT <= 1'b0;
state <= DROP_LCD_E;
if (Next_Char [7:4]  != 4'h0)        DATA_BUS_VALUE <= Next_Char;
else if  (Next_Char [3:0] > 9)       DATA_BUS_VALUE <= {4'h4, Next_Char [3:0] - 4'h9};
        else DATA_BUS_VALUE <= {4'h3, Next_Char [3:0] };

if  ( (CHAR_COUNT < 31) && (Next_Char != 8'hFE) )        CHAR_COUNT <= CHAR_COUNT + 1;
else        CHAR_COUNT <= 5'b0;

if  (CHAR_COUNT == 15)  next_command  <= LINE2;
else if  ( (CHAR_COUNT == 31 ) || (Next_Char     == 8'hFE))         next_command <= RETURN_HOME;
       else  next_command <= Print_String;
end

LINE2:  begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'hC0;
state <= DROP_LCD_E;
next_command <= Print_String;
end

RETURN_HOME: begin 
E <= 1'b1;
RS <= 1'b0;
LCD_RW_INT <= 1'b0;
DATA_BUS_VALUE <= 8'h80;
state <= DROP_LCD_E;
next_command <= Print_String;
end

DROP_LCD_E: begin 
E <= 1'b0;
state <= HOLD;
end


HOLD:  state <= next_command;

endcase
endmodule

module LCD_String (index, out); //Bring the next character to display 
input [4:0] index;
output [7:0] out;
reg [7:0] out;

always 
case (index)
5'h00: out <= 8'h45;//E
5'h01: out <= 8'h47;//G
5'h02: out <= 8'h43;//C
5'h03: out <= 8'h33;//3
5'h04: out <= 8'h32;//2
5'h05: out <= 8'h30;//0
5'h06: out <= 8'h20;//space
5'h07: out <= 8'h20;//space
// Line 2
5'h10: out <= 8'h50;//P
5'h11: out <= 8'h52;//R
5'h12: out <= 8'h4F;//O
5'h13: out <= 8'h4A;//J
5'h14: out <= 8'h45;//E
5'h15: out <= 8'h43;//C
5'h16: out <= 8'h54;//T
5'h17: out <= 8'h20;//space
default: out <= 8'h20;//space
endcase
endmodule
*/