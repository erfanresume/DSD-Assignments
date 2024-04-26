library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD is 
	port(
		clk,reset: in std_logic;
		en: in std_logic_vector(3 downto 0);
		--input: in std_logic_vector(3 downto 0); 
		output: out std_logic_vector(6 downto 0)
		);
end BCD;

architecture behavioral of BCD is
	signal r_reg,r_next: std_logic_vector(6 downto 0);
		begin
		--State register
			process(clk,reset)
				begin
					if (reset = '1') then
						r_reg <= (others =>'0');
					elsif (clk' event and clk = '1') then
						r_reg <= r_next;
					end if;
			end process;
		--Next state logic
			process(r_reg,en)
			begin 
				case en is
					when "0000" =>
						r_next <= "1111110";-- a b c d e f g
					when "0001" =>
						r_next <= "0110000";
					when "0010" =>
						r_next <= "1101101";
					when "0011" =>
						r_next <= "1111001";
					when "0100" =>
						r_next <= "0110011";
					when "0101" =>
						r_next <= "1011011";
					when "0110" =>
						r_next <= "1011111";
					when "0111" =>
						r_next <= "1110000";
					when "1000" =>
						r_next <= "1111111";
					--when "1001" =>
					--	r_next <= "1111011";
					when others => 
						r_next <= "1111011";
				end case;
			end process;
		--Output
			output <= r_reg;
end behavioral;	