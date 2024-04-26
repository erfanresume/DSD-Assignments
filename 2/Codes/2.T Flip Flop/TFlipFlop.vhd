library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TFlipFlop is 
	port(
		clk,reset: in std_logic;
		t: in std_logic; 
		q: out std_logic
		);
end TFlipFlop;

architecture behavioral of TFlipFlop is
	signal r_next,r_reg: std_logic;
		begin
			--State register
			process(clk,reset)
				begin
					if (reset = '1') then
						r_reg <= '0';
					elsif (clk' event and clk = '1' ) then
						r_reg <= r_next ;
					end if;
			end process;
			--Next State Logic
			r_next <= t xor r_reg;
			--Output
			q <= r_reg;
end behavioral;	



