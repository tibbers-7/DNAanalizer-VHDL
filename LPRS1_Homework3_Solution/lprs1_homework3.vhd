
library ieee;
use ieee.std_logic_1164.all;
-- Libraries.

entity lprs1_homework3 is
	port(
		i_clk         :  in std_logic;
		i_rst         :  in std_logic;
		i_base        :  in std_logic_vector(1 downto 0);
		o_cnt_subseq0 : out std_logic_vector(3 downto 0);
		o_cnt_subseq1 : out std_logic_vector(3 downto 0);
		o_cnt_subseq2 : out std_logic_vector(3 downto 0)
	);
end entity;


architecture arch of lprs1_homework3 is
	-- Constants.
	constant A : std_logic_vector(1 downto 0) := "00";
	constant C : std_logic_vector(1 downto 0) := "01";
	constant G : std_logic_vector(1 downto 0) := "10";
	constant T : std_logic_vector(1 downto 0) := "11";
	
	-- Signals.
	
begin
	-- Body.
	
end architecture;
