library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity andgate is
	port (
			full: in std_logic;
			wr: in std_logic;
			wr_en: out std_logic
		  );
end andgate;

architecture behavioral of andgate is

begin
	wr_en <= wr and not(full);
end behavioral;