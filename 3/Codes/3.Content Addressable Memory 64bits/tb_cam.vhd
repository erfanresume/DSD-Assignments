library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_cam is 
end tb_cam;

  
architecture behavioral of tb_cam is
 
component cam is
	port (
			clk,reset: in std_logic;
			w_en: in std_logic;
			key_in: in std_logic_vector(31 downto 0);
			w_data: in std_logic_vector(63 downto 0);
			hit: out std_logic;
			r_data: out std_logic_vector(63 downto 0)
		  );
end component;

    signal tb_clk,tb_reset: std_logic:='0';
	 signal tb_w_en: std_logic; 
    signal tb_key_in: std_logic_vector(31 downto 0);
	 signal tb_hit: std_logic;
    signal tb_w_data : std_logic_vector(63 downto 0);
	 signal tb_r_data : std_logic_vector(63 downto 0);
    
	 constant clk_period : time := 10 ns;
	 constant reset_period : time := 10 ns;

  begin
		
		utt: cam port map(
								clk => tb_clk,
								reset => tb_reset,
								w_en => tb_w_en,
								key_in => tb_key_in,
								hit => tb_hit,
								w_data => tb_w_data,
								r_data => tb_r_data
								);
        --U1_Test: entity work.fifo(behavioral) port map(
           --   clk => tb_clk, 
            --  reset => tb_reset,
            --  input => tb_input,
            --  output => tb_output
           -- );
 
 reset_process :process
		begin
			tb_reset <= '1';
			wait for 10ns;
			tb_reset <= '0';
			wait;
		end process;
 
 clk_process :process
		begin
			tb_clk <= '0';
			wait for clk_period; 
			tb_clk <= '1';
			wait for clk_period;
		end process;
	
	
 sim_proc: process   
      begin
			tb_w_en <= '1';
			tb_w_data <= x"0000000000000001";
			tb_key_in <= x"00000000";
			wait for 50ns;
			tb_w_en <= '1';
			tb_w_data <= x"0000000000000002";
			tb_key_in <= x"00000001";
			wait for 50ns;
			tb_w_en <= '1';
			tb_w_data <= x"0000000000000003";
			tb_key_in <= x"00000002";
			wait for 50ns;
			tb_w_en <= '1';
			tb_w_data <= x"0000000000000004";
			tb_key_in <= x"00000003";
			wait for 50ns;
			tb_w_en <= '0';
			tb_w_data <= x"0000000000000005";
			tb_key_in <= x"00000004";
			wait for 50ns;
			tb_w_en <= '1';
			tb_w_data <= x"0000000000000006";
			tb_key_in <= x"00000004";
			wait for 50ns;
			tb_w_en <= '1';
			tb_key_in <= x"00000004";
			wait for 50ns;
     end process;
       
end  behavioral;








