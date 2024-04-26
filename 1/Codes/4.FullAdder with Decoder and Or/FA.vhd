library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA is 
 
  port( 
        X,Y,Cin : in std_logic;
        sum,cout : out std_logic
      );
end FA;

architecture behavioral of FA is  

	signal p: std_logic_vector(2 downto 0);
	signal s: std_logic_vector(7 downto 0);

component Decoder is
	port(
		input : in std_logic_vector(2 downto 0);
      output : out std_logic_vector(7 downto 0)
	);
end component;	
	
begin
   p(0) <= Cin;
	p(1) <= Y;
	p(2) <= X;     

l1: decoder port map(p,s);
sum <= s(1) or s(2) or s(4) or s(7);
cout <= s(3) or s(5) or s(6) or s(7);
     
end  behavioral;




