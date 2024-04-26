library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo is
	port (
			clk,reset: in std_logic;
			wr,rd: in std_logic;
			w_data: in std_logic_vector(31 downto 0);
			full,empty: out std_logic;
			r_data: out std_logic_vector(31 downto 0)
		  );
end fifo;

architecture behavioral of fifo is

--register
component reg_file is
	port (
			clk,reset: in std_logic;
			wr_en: in std_logic;
			w_data: in std_logic_vector(31 downto 0);
			w_address: in std_logic_vector(1 downto 0);
			r_address: in std_logic_vector(1 downto 0);
			r_data: out std_logic_vector(31 downto 0)
		  );
end component;

--controller
component controller is	
	port (
			clk,reset: in std_logic;
			wr,rd: in std_logic;
			w_address: out std_logic_vector(1 downto 0);
			r_address: out std_logic_vector(1 downto 0);
			full,empty: out std_logic
		  );
end component;

--and gate
component andgate is
	port(
			full: in std_logic;
			wr: in std_logic;
			wr_en: out std_logic
		 );
end component;

	signal r_address,w_address: std_logic_vector(1 downto 0);
	signal wr_en,full_fifo: std_logic;
	
begin
	fifocontroller: controller port map(
											  clk => clk,
											  reset => reset,
											  wr => wr,
											  rd => rd,
											  w_address => w_address,
											  r_address => r_address,
											  full => full_fifo,
											  empty => empty
											 );
   andenable: andgate port map(
										 wr => wr,
										 full => full_fifo,
										 wr_en => wr_en
										);
	registerfile: reg_file port map(
											  clk => clk,
											  reset => reset,
											  wr_en => wr_en,
											  w_address => w_address,
											  r_address => r_address,
											  r_data => r_data,
											  w_data => w_data
											 );
	full <= full_fifo;
end behavioral;
