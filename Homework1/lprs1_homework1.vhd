library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
-- Libraries.

entity lprs1_homework1 is
	port(
		i_x   :  in std_logic_vector(3 downto 0);
		i_y   :  in std_logic_vector(3 downto 0);
		i_z   :  in std_logic_vector(1 downto 0);
		i_sel :  in std_logic_vector(1 downto 0);
		o_res : out std_logic_vector(3 downto 0);
		o_cmp : out std_logic_vector(1 downto 0);
		o_enc : out std_logic_vector(1 downto 0)
	);
end entity;


architecture arch of lprs1_homework1 is
	-- Signals.
	signal s_shl : std_logic_vector (3 downto 0);
	signal s_shr : std_logic_vector (3 downto 0);
	signal s_dec : std_logic_vector (3 downto 0);
	signal s_add : std_logic_vector (3 downto 0);
	signal s_sub : std_logic_vector (3 downto 0);
	signal s_mux : std_logic_vector (3 downto 0);
	signal s_const0 : std_logic_vector (3 downto 0) := "0010";
	signal s_const1 : std_logic_vector (3 downto 0) := "1011";
begin
	--Dekoder
	s_dec <= "0001" when i_z="00" else
				"0010" when i_z="01" else
				 "0100" when i_z="10" else
				 "1000";
				
	--Oduzimac
	s_sub <= s_dec + (not(i_x)+1);
	
	--Pomerac
	s_shr <= i_y(3) & i_y(3) & i_y(3) & i_y(3);
	s_shl <= i_x(2 downto 0) & "0";
	
	--Sabirac
	s_add <= s_shl + s_shr;
	
	--Multiplekser
	s_mux <= s_sub when i_sel="00" else
				s_add when i_sel="01" else
				s_const1 when i_sel="10" else
				s_const0;
				
	--Izlaz
	o_res <= s_mux;
	
	process (s_mux) begin
		if (s_mux = 0) then
			o_cmp(0) <= '0';
		else o_cmp(0) <= '1';
		end if;
	end process;
	
	
	
	process (s_mux) begin
		if (s_mux > 0) then
			o_cmp(1) <= '1';
		else o_cmp(1) <= '0';
		end if;
		end process;
		
		
	o_enc <= "00"	when s_mux(0)='1' else
				"01" when s_mux(1)='1' else
				"10" when s_mux(2)='1' else
				"11";
				
end architecture;