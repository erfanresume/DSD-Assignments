library ieee;
use ieee.std_logic_1164.all;

entity z is  
  
  port( a,b,c,d : in std_logic;
        z : out std_logic
      );
        
end z;

architecture behavioral of z is
	signal e,f: std_logic;
  begin
    --z <= ((a and b and c) or d ) xor not((b nor c) nand a);
    e <= (a and b and c)  or d;
	 f <= ((b nor c) nand a);
	 z <= e xor not f;
end  behavioral;
