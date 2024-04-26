-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/07/2023 11:30:57"

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

ENTITY 	Carry_look_ahead IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	s : BUFFER std_logic_vector(3 DOWNTO 0);
	cout : BUFFER std_logic
	);
END Carry_look_ahead;

-- Design Ports Information
-- s[0]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[1]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[2]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[3]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Carry_look_ahead IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_s : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \s[0]~output_o\ : std_logic;
SIGNAL \s[1]~output_o\ : std_logic;
SIGNAL \s[2]~output_o\ : std_logic;
SIGNAL \s[3]~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \PFA1|s~combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \PFA2|p~combout\ : std_logic;
SIGNAL \PFA2|s~combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \c2~0_combout\ : std_logic;
SIGNAL \c2~1_combout\ : std_logic;
SIGNAL \PFA3|s~combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \cout~0_combout\ : std_logic;
SIGNAL \cout~1_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \c3~0_combout\ : std_logic;
SIGNAL \PFA4|s~combout\ : std_logic;
SIGNAL \cout~2_combout\ : std_logic;
SIGNAL \cout~3_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
s <= ww_s;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y34_N2
\s[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PFA1|s~combout\,
	devoe => ww_devoe,
	o => \s[0]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\s[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PFA2|s~combout\,
	devoe => ww_devoe,
	o => \s[1]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\s[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PFA3|s~combout\,
	devoe => ww_devoe,
	o => \s[2]~output_o\);

-- Location: IOOBUF_X0_Y30_N2
\s[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PFA4|s~combout\,
	devoe => ww_devoe,
	o => \s[3]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\cout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cout~3_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOIBUF_X0_Y35_N8
\a[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X0_Y33_N22
\b[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X0_Y35_N15
\cin~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LCCOMB_X1_Y32_N0
\PFA1|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \PFA1|s~combout\ = \a[0]~input_o\ $ (\b[0]~input_o\ $ (\cin~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	datad => \cin~input_o\,
	combout => \PFA1|s~combout\);

-- Location: IOIBUF_X0_Y34_N8
\a[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X0_Y31_N15
\b[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X1_Y32_N18
\PFA2|p\ : cycloneive_lcell_comb
-- Equation(s):
-- \PFA2|p~combout\ = \a[1]~input_o\ $ (\b[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	combout => \PFA2|p~combout\);

-- Location: LCCOMB_X1_Y32_N28
\PFA2|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \PFA2|s~combout\ = \PFA2|p~combout\ $ (((\cin~input_o\ & ((\a[0]~input_o\) # (\b[0]~input_o\))) # (!\cin~input_o\ & (\a[0]~input_o\ & \b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	datad => \PFA2|p~combout\,
	combout => \PFA2|s~combout\);

-- Location: IOIBUF_X0_Y32_N15
\b[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X0_Y34_N15
\a[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X1_Y32_N14
\c2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c2~0_combout\ = (\cin~input_o\ & (\PFA2|p~combout\ & (\a[0]~input_o\ $ (\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	datad => \PFA2|p~combout\,
	combout => \c2~0_combout\);

-- Location: LCCOMB_X1_Y32_N16
\c2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \c2~1_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\) # ((\b[0]~input_o\ & \a[0]~input_o\)))) # (!\a[1]~input_o\ & (\b[0]~input_o\ & (\a[0]~input_o\ & \b[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[0]~input_o\,
	datac => \a[0]~input_o\,
	datad => \b[1]~input_o\,
	combout => \c2~1_combout\);

-- Location: LCCOMB_X1_Y32_N2
\PFA3|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \PFA3|s~combout\ = \b[2]~input_o\ $ (\a[2]~input_o\ $ (((\c2~0_combout\) # (\c2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \a[2]~input_o\,
	datac => \c2~0_combout\,
	datad => \c2~1_combout\,
	combout => \PFA3|s~combout\);

-- Location: IOIBUF_X0_Y30_N8
\b[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X1_Y32_N6
\cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cout~0_combout\ = (\b[1]~input_o\ & (!\a[1]~input_o\ & (\b[2]~input_o\ $ (\a[2]~input_o\)))) # (!\b[1]~input_o\ & (\a[1]~input_o\ & (\b[2]~input_o\ $ (\a[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \cout~0_combout\);

-- Location: LCCOMB_X1_Y32_N24
\cout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \cout~1_combout\ = (\cout~0_combout\ & ((\cin~input_o\ & ((\a[0]~input_o\) # (\b[0]~input_o\))) # (!\cin~input_o\ & (\a[0]~input_o\ & \b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cin~input_o\,
	datab => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	datad => \cout~0_combout\,
	combout => \cout~1_combout\);

-- Location: IOIBUF_X0_Y32_N22
\a[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X1_Y32_N20
\c3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c3~0_combout\ = (\b[2]~input_o\ & ((\a[2]~input_o\) # ((\b[1]~input_o\ & \a[1]~input_o\)))) # (!\b[2]~input_o\ & (\b[1]~input_o\ & (\a[1]~input_o\ & \a[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \c3~0_combout\);

-- Location: LCCOMB_X1_Y32_N10
\PFA4|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \PFA4|s~combout\ = \b[3]~input_o\ $ (\a[3]~input_o\ $ (((\cout~1_combout\) # (\c3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \cout~1_combout\,
	datac => \a[3]~input_o\,
	datad => \c3~0_combout\,
	combout => \PFA4|s~combout\);

-- Location: LCCOMB_X1_Y32_N12
\cout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \cout~2_combout\ = (\b[2]~input_o\ & ((\a[2]~input_o\) # ((\b[1]~input_o\ & \a[1]~input_o\)))) # (!\b[2]~input_o\ & (\b[1]~input_o\ & (\a[1]~input_o\ & \a[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \cout~2_combout\);

-- Location: LCCOMB_X1_Y32_N22
\cout~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \cout~3_combout\ = (\b[3]~input_o\ & ((\cout~1_combout\) # ((\a[3]~input_o\) # (\cout~2_combout\)))) # (!\b[3]~input_o\ & (\a[3]~input_o\ & ((\cout~1_combout\) # (\cout~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \cout~1_combout\,
	datac => \a[3]~input_o\,
	datad => \cout~2_combout\,
	combout => \cout~3_combout\);

ww_s(0) <= \s[0]~output_o\;

ww_s(1) <= \s[1]~output_o\;

ww_s(2) <= \s[2]~output_o\;

ww_s(3) <= \s[3]~output_o\;

ww_cout <= \cout~output_o\;
END structure;


