library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
	port (
			clk,reset: in std_logic;
			wr,rd: in std_logic;
			w_address: out std_logic_vector(1 downto 0);--we need 2 bits for 4 slots but we consider 3 bits for our overflow or underflow politics
			r_address: out std_logic_vector(1 downto 0);
			full,empty: out std_logic
		  );
end controller;

architecture behavioral of controller is  --wp_reg is write pointer and rp_reg is read pointer
	signal rp_reg,rp_next: unsigned(2 downto 0);
	signal wp_reg,wp_next: unsigned(2 downto 0);
begin
	--state register
		process(clk,reset)
		begin
			if (reset = '1') then 
				rp_reg <= (others => '0');
				wp_reg <= (others => '0');
			elsif (clk' event and clk='1') then 
				rp_reg <= rp_next;
				wp_reg <= wp_next;
			end if;
		end process;
	
	--next state logic 
		--read
			process(rp_reg,rd)
			begin 
				if (rd = '1') then
					if (rp_reg = "111") then 
						rp_next <= "000";
					else 
						rp_next <= rp_reg + 1;
					end if;
				else
					rp_next <= rp_reg;
				end if;
			end process;
		--write
			process(wp_reg,wr)
		begin 
			if (wr = '1') then
				if (wp_reg = "111") then 
					wp_next <= "000";
				else 
					wp_next <= wp_reg + 1;
				end if;
			else
				wp_next <= wp_reg;
			end if;
		end process;
	--output logic
		--read address
			r_address <= std_logic_vector(rp_reg(1 downto 0));
		--write address 
			w_address <= std_logic_vector(wp_reg(1 downto 0));
		--full and empty buffer
			process(rp_reg,wp_reg)
			begin
				if (rp_reg(1 downto 0) = wp_reg(1 downto 0)) then
					if (rp_reg(2) = wp_reg(2)) then
						empty <= '1';
						full <= '0';
					else 
						empty <= '0';
						full <= '1';
					end if;
				else
					empty <= '0';
					full <= '0';
				end if;
			end process;
end behavioral;