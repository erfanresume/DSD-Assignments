library ieee;
use ieee.std_logic_1164.all;

entity tb_BCD is 
end tb_BCD;

  
architecture behavioral of tb_BCD is
 
    signal tb_clk,tb_reset : std_logic:='0';
    signal tb_dir : std_logic;
    signal tb_output : std_logic_vector(3 downto 0);
    
	 constant clk_period : time := 10 ns;

  begin
  
        U1_Test: entity work.BCD(behavioral) port map(
              clk => tb_clk, 
              reset => tb_reset,
              dir => tb_dir,
              output => tb_output
            );
 
 clk_process :process
		begin
			tb_clk <= '0';
			wait for clk_period/2; 
			tb_clk <= '1';
			wait for clk_period/2;
		end process;
	
	
 sim_proc: process   
      begin
		
			tb_dir <= '0';
			wait for 100 ns;
			
			tb_reset <= '1';
			wait for 10 ns;
			tb_reset <= '0';

		
         tb_dir <= '1';
			wait for 100 ns;
			
			
     end process;
       
end  behavioral;








