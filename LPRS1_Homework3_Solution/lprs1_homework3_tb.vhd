
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

entity lprs1_homework3_tb is
end entity;

architecture arch of lprs1_homework3_tb is
	-- Constants.
	constant A : std_logic_vector(1 downto 0) := "00";
	constant C : std_logic_vector(1 downto 0) := "01";
	constant G : std_logic_vector(1 downto 0) := "10";
	constant T : std_logic_vector(1 downto 0) := "11";
	
	
	constant i_clk_period : time := 10 ns;
	
	signal i_clk         : std_logic;
	signal i_rst         : std_logic;
	signal i_base        : std_logic_vector(1 downto 0);
	signal o_cnt_subseq0 : std_logic_vector(3 downto 0);
	signal o_cnt_subseq1 : std_logic_vector(3 downto 0);
	signal o_cnt_subseq2 : std_logic_vector(3 downto 0);
	
begin
	
	uut: entity work.lprs1_homework3
	port map(
		i_clk         => i_clk,
		i_rst         => i_rst,
		i_base        => i_base,
		o_cnt_subseq0 => o_cnt_subseq0,
		o_cnt_subseq1 => o_cnt_subseq1,
		o_cnt_subseq2 => o_cnt_subseq2
	);
	
	clk_p: process
	begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
	end process;
	
	stim_p: process
	begin
		-- Test cases:
		
		wait;
	end process;
	
	
end architecture;
