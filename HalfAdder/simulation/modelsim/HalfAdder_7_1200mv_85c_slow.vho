-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

-- DATE "11/26/2019 13:18:28"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	HalfAdder IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	sum : BUFFER std_logic;
	carry : BUFFER std_logic
	);
END HalfAdder;

-- Design Ports Information
-- sum	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- carry	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF HalfAdder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_sum : std_logic;
SIGNAL ww_carry : std_logic;
SIGNAL \sum~output_o\ : std_logic;
SIGNAL \carry~output_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \sum~0_combout\ : std_logic;
SIGNAL \Mult0~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
sum <= ww_sum;
carry <= ww_carry;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X94_Y73_N2
\sum~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~0_combout\,
	devoe => ww_devoe,
	o => \sum~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\carry~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mult0~0_combout\,
	devoe => ww_devoe,
	o => \carry~output_o\);

-- Location: IOIBUF_X115_Y14_N1
\b~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\a~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: LCCOMB_X103_Y17_N24
\sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sum~0_combout\ = \b~input_o\ $ (\a~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b~input_o\,
	datad => \a~input_o\,
	combout => \sum~0_combout\);

-- Location: LCCOMB_X103_Y17_N26
\Mult0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0~0_combout\ = (\b~input_o\ & \a~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b~input_o\,
	datad => \a~input_o\,
	combout => \Mult0~0_combout\);

ww_sum <= \sum~output_o\;

ww_carry <= \carry~output_o\;
END structure;


