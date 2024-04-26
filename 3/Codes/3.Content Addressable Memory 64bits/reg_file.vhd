library ieee;
use ieee.std_logic_1164.all;

--single port register
entity reg_file is
	port(
			clk,reset,w_en: in std_logic;
			w_address: in std_logic_vector(3 downto 0);
			r_address: in std_logic_vector(3 downto 0);
			w_data: in std_logic_vector(63 downto 0);
			r_data: out std_logic_vector(63 downto 0)
	);
end reg_file;

architecture behavioral of reg_file is

type reg_file_type is array(15 downto 0) of std_logic_vector(63 downto 0);
	
	signal r_reg,r_next: reg_file_type;
	signal en: std_logic_vector(15 downto 0);
begin
	process(clk,reset)
	begin
		if (reset = '1') then 
			r_reg <= (others => (others => '0'));
		elsif (clk' event and clk = '1') then 
			r_reg <= r_next;
		end if;
	end process;
--next state logic
	--decoder
		process(w_address,w_en)
		begin
			if (w_en = '0') then
				en <= (others => '0');
			else 
				case w_address is
					when "0000" => 
						en <= x"0001";
					when "0001" => 
						en <= x"0002";
					when "0010" => 
						en <= x"0004";
					when "0011" => 
						en <= x"0007";
					when "0100" => 
						en <= x"0010";
					when "0101" => 
						en <= x"0020";
					when "0110" => 
						en <= x"0040";
					when "0111" => 
						en <= x"0070";
					when "1000" => 
						en <= x"0100";
					when "1001" => 
						en <= x"0200";
					when "1010" => 
						en <= x"0400";
					when "1011" => 
						en <= x"0700";
					when "1100" => 
						en <= x"1000";
					when "1101" => 
						en <= x"2000";
					when "1110" => 
						en <= x"4000";
					when others => 
						en <= x"7000";
				end case;
			end if;
		end process;
	--enable 
		process(r_reg,en,w_data)
		begin
			r_next <= r_reg;
			if en(15) = '1' then
				r_next(15) <= w_data;
			end if;
			if en(14) = '1' then
				r_next(14) <= w_data;
			end if;
			if en(13) = '1' then
				r_next(13) <= w_data;
			end if;
			if en(12) = '1' then
				r_next(12) <= w_data;
			end if;
			if en(11) = '1' then
				r_next(11) <= w_data;
			end if;
			if en(10) = '1' then
				r_next(10) <= w_data;
			end if;
			if en(9) = '1' then
				r_next(9) <= w_data;
			end if;
			if en(8) = '1' then
				r_next(8) <= w_data;
			end if;
			if en(7) = '1' then
				r_next(7) <= w_data;
			end if;
			if en(6) = '1' then
				r_next(6) <= w_data;
			end if;
			if en(5) = '1' then
				r_next(5) <= w_data;
			end if;
			if en(4) = '1' then
				r_next(4) <= w_data;
			end if;
			if en(3) = '1' then
				r_next(3) <= w_data;
			end if;
			if en(2) = '1' then
				r_next(2) <= w_data;
			end if;
			if en(1) = '1' then
				r_next(1) <= w_data;
			end if;
			if en(0) = '1' then
				r_next(0) <= w_data;
			end if;
		end process;
	--read	
		with r_address select 
			r_data <= r_reg(0) when  "0000",
						 r_reg(1) when  "0001",
						 r_reg(2) when  "0010",
						 r_reg(3) when  "0011",
						 r_reg(4) when  "0100",
						 r_reg(5) when  "0101",
						 r_reg(6) when  "0110",
						 r_reg(7) when  "0111",
						 r_reg(8) when  "1000",
						 r_reg(9) when  "1001",
						 r_reg(10) when "1010",
						 r_reg(11) when "1011",
						 r_reg(12) when "1100",
						 r_reg(13) when "1101",
						 r_reg(14) when "1110",
						 r_reg(15) when others;
end behavioral;
	