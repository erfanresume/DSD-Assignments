library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  

entity controller is
	port(
			clk,reset,w_en: in std_logic;
			key_in: in std_logic_vector(31 downto 0);
			address_out: out std_logic_vector(3 downto 0);--we have 16 data in our register and memory witch could show it with 4 bits
			hit: out std_logic
	);
end controller;

architecture behavioral of controller is

type mem_type is array(15 downto 0) of std_logic_vector(31 downto 0);
	
	signal m_reg,m_next: mem_type;
	signal rep_reg,rep_next: unsigned(3 downto 0);
	signal en,match: std_logic_vector(15 downto 0);
	signal addrressmatch: std_logic_vector(3 downto 0);
	signal hit_flag: std_logic;
	
begin
	process(clk,reset)
	begin
		if (reset = '1') then 
			m_reg <= (others => (others => '0'));
			rep_reg <= (others => '0');
		elsif (clk' event and clk = '1') then 
			m_reg <= m_next;
			rep_reg <= rep_next;
		end if;
	end process;
--next state logic
	--decoder
		process(w_en,hit_flag,rep_reg)
		begin
			if (w_en = '0') then
				en <= (others => '0');
			elsif (w_en = '1' and hit_flag = '1') then
				en <= (others => '0');
			else 
				case rep_reg is
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
		process(m_reg,en,key_in)
		begin
			m_next <= m_reg;
			if en(15) = '1' then
				m_next(15) <= key_in;
			end if;
			if en(14) = '1' then
				m_next(14) <= key_in;
			end if;
			if en(13) = '1' then
				m_next(13) <= key_in;
			end if;
			if en(12) = '1' then
				m_next(12) <= key_in;
			end if;
			if en(11) = '1' then
				m_next(11) <= key_in;
			end if;
			if en(10) = '1' then
				m_next(10) <= key_in;
			end if;
			if en(9) = '1' then
				m_next(9) <= key_in;
			end if;
			if en(8) = '1' then
				m_next(8) <= key_in;
			end if;
			if en(7) = '1' then
				m_next(7) <= key_in;
			end if;
			if en(6) = '1' then
				m_next(6) <= key_in;
			end if;
			if en(5) = '1' then
				m_next(5) <= key_in;
			end if;
			if en(4) = '1' then
				m_next(4) <= key_in;
			end if;
			if en(3) = '1' then
				m_next(3) <= key_in;
			end if;
			if en(2) = '1' then
				m_next(2) <= key_in;
			end if;
			if en(1) = '1' then
				m_next(1) <= key_in;
			end if;
			if en(0) = '1' then
				m_next(0) <= key_in;
			end if;
		end process;
	--replacement pointer
		rep_next <= rep_reg + 1 when (hit_flag = '0' and w_en = '1') else
						rep_reg;
	--matching circut 
		process(m_reg,key_in)
		begin
			match <= (others => '0');
			if (m_reg(15) = key_in) then 
				 match(15) <= '1';
			end if;
			if (m_reg(14) = key_in) then 
				 match(14) <= '1';
			end if;
			if (m_reg(13) = key_in) then 
				 match(13) <= '1';
			end if;
			if (m_reg(12) = key_in) then 
				 match(12) <= '1';
			end if;
			if (m_reg(11) = key_in) then 
				 match(11) <= '1';
			end if;
			if (m_reg(10) = key_in) then 
				 match(10) <= '1';
			end if;
			if (m_reg(9) = key_in) then 
				 match(9) <= '1';
			end if;
			if (m_reg(8) = key_in) then 
				 match(8) <= '1';
			end if;
			if (m_reg(7) = key_in) then 
				 match(7) <= '1';
			end if;
			if (m_reg(6) = key_in) then 
				 match(6) <= '1';
			end if;
			if (m_reg(5) = key_in) then 
				 match(5) <= '1';
			end if;
			if (m_reg(4) = key_in) then 
				 match(4) <= '1';
			end if;
			if (m_reg(3) = key_in) then 
				 match(3) <= '1';
			end if;
			if (m_reg(2) = key_in) then 
				 match(2) <= '1';
			end if;
			if (m_reg(1) = key_in) then 
				 match(1) <= '1';
			end if;
			if (m_reg(0) = key_in) then 
				 match(0) <= '1';
			end if;
		end process;
	--encoding	
		with match select 
			addrressmatch <= "0000" when x"0001",
						        "0001" when x"0002",
								  "0010" when x"0004",
								  "0011" when x"0007",
								  "0100" when x"0010",
								  "0101" when x"0020",
								  "0110" when x"0040",
								  "0111" when x"0070",
								  "1000" when x"0100",
								  "1001" when x"0200",
								  "1010" when x"0400",
								  "1011" when x"0700",
								  "1100" when x"1000",
								  "1101" when x"2000",
								  "1110" when x"4000",
								  "1111" when others; 
	--hit
		hit_flag <= '1' when match =not(x"0000")  else 
				 '0';
	--address out
		address_out <= addrressmatch when hit_flag = '1' else
							std_logic_vector(rep_reg);
		hit <= hit_flag;
end behavioral;
	