library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_TFlipFlop is
end tb_TFlipFlop;

architecture behavioral of tb_TFlipFlop is
	
	--Inputs
	signal tb_clk: std_logic := '0';
	signal tb_reset: std_logic := '0';
	signal tb_t: std_logic;
	signal tb_q: std_logic;
	
	-- Clock period definitions
	constant clk_period : time := 10 ns;
	
begin

	U1_Test: entity work.TFlipFlop(behavioral) port map(
              clk => tb_clk, 
              reset => tb_reset,
              t => tb_t,
              q => tb_q
            );
				
	
	clk_process :process
		begin
			tb_clk <= '0';
			wait for clk_period/2; 
			tb_clk <= '1';
			wait for clk_period/2;
		end process;
	
	stim_process:process
	
		begin    
		
			tb_reset <= '1';
			wait for clk_period*2;
		
			tb_t <= '0';
			wait for 100 ns;
			
			tb_t <= '1';
			wait for 100 ns;
			
			tb_t <= '1';
			wait for 100 ns;
			
			tb_t <= '1';
			wait for 100 ns;
			
			tb_t <= '0';
			wait for 100 ns;
		
		
	end process;
end behavioral;