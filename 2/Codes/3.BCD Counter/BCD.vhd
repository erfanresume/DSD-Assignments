library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD is
	port(
		clk,reset : in std_logic;
		dir : in std_logic;
		output : out std_logic_vector(3 downto 0)
	);
end BCD;

architecture behavioral of BCD is 
	signal r_reg,r_next,r_inc : unsigned(3 downto 0);
begin
	--state register
	process(clk,reset)
	begin
		if (reset = '1')  then 
			r_reg <= (others => '0');
		elsif (clk' event and clk = '1') then 
			r_reg <= r_next;
		end if;
	end process;
	--next state logic 
	r_next <= "0000" when (dir = '0' and r_reg = "1001") else
				 "1001" when (dir = '1' and r_reg = "0000") else
				 r_reg + 1 when dir = '0' else
				 r_reg - 1 when dir = '1';
	--output
	output <= std_logic_vector(r_reg);
end behavioral;