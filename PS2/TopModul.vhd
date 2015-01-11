----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:38 10/23/2014 
-- Design Name: 
-- Module Name:    TopModul - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE. STD_LOGIC_ARITH. ALL;
use IEEE. STD_LOGIC_UNSIGNED. ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopModul is
Port (
	clk_i: in STD_LOGIC;
	reset_i: in STD_LOGIC;
	data_i: in STD_LOGIC_VECTOR(15 downto 0);
	cathode_o: out STD_LOGIC_VECTOR(6 downto 0);
	anode_o: out STD_LOGIC_VECTOR (3 downto 0)
);
end TopModul;

architecture Behavioral of TopModul is
	
	component prescaler
		Generic (width: integer := 8; value: integer := 255);
		Port (clk_i: in STD_LOGIC; reset_i: in STD_LOGIC;	enable_o: out STD_LOGIC	);
	end component;
		
	component seg7
		Port (clk_i: in STD_LOGIC; reset_i: in STD_LOGIC; data_i: in STD_LOGIC_VECTOR(15 downto 0); refresh_i: in STD_LOGIC; 
		cathode_o: out STD_LOGIC_VECTOR(6 downto 0); anode_o: out STD_LOGIC_VECTOR(3 downto 0)	);
	end component;
	
	signal enable: STD_LOGIC;
	signal refresh: STD_LOGIC;
	signal count: STD_LOGIC_VECTOR(15 downto 0);

	
begin
	
	psc2 : prescaler
	generic map ( 
		width => 18,
		value => 200000
	)
	port map (
		clk_i => clk_i,
		reset_i => reset_i,
		enable_o => refresh
	);

		
	s7 : seg7
	port map (
		clk_i => clk_i,
		reset_i => reset_i,
		data_i => data_i,
		refresh_i => refresh,
		cathode_o => cathode_o,
		anode_o => anode_o
	);


end Behavioral;