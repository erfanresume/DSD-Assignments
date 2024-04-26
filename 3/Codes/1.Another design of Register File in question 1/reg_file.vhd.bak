library ieee;
use ieee.std_logic_1164;
use ieee.numeric_std.all;

entity reg_file is
	port (
			clk,reset: in std_logic;
			wr_en: in std_logic;
			w_data: in std_logic_vector(31 downto 0);--each slot is 4 bytes (32 bits)
			w_address: in std_logic_vector(1 downto 0);--we need 2 bits for 4 slots but we consider 3 bits for our overflow or underflow politics
			r_address: in std_logic_vector(1 downto 0);
			r_data: out std_logic_vector(31 downto 0)
		  );
end reg_file;

architecture behavioral of reg_file is

type reg_file_type is array (3 downto 0) of std_logic_vector(31 downto 0);
	signal array_reg,array_next: reg_file_type;
	
begin
	--register file
		process(clk,reset)
		begin
			if (reset = '1') then 
				array_reg <= (others =>(others => '0'));
			elsif (clk' event and clk='1') then 
				array_reg <= array_next;
			end if;
		end process;
	
	--next state logic
		process(w_data,w_address,wr_en,array_reg)
		begin 
			if (wr_en = '1') then
				array_next(to_integer(unsigned(w_address))) <= w_data; 
			else
				array_next <= array_reg;
			end if;
		end process;
	--read port
		r_data <= array_reg(to_integer(unsigned(r_address)));
end behavioral;