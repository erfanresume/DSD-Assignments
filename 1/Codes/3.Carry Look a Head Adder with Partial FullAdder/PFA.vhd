library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PFA is 
	port(
		a,b,cin: in std_logic;
		s,p,g: out std_logic
		);
end PFA;

architecture behavioral of PFA is
		begin
			process(a,b,cin)
				begin
					s <= (a xor b) xor cin;
					p <= (a xor b);
					g <= a and b;
			end process;
end behavioral;	