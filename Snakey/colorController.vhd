----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:36 02/02/2015 
-- Design Name: 
-- Module Name:    colorController - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity colorController is
    Port ( clk_i : 		IN  STD_LOGIC;
           rst_i : 		IN  STD_LOGIC;
           en_i : 		IN  STD_LOGIC;
			  gameRst_i : 	IN  STD_LOGIC;
           col_o : 		OUT STD_LOGIC_VECTOR (7 downto 0));
end colorController;

architecture Behavioral of colorController is
	
	COMPONENT counter
	GENERIC (
		width: integer := 3;
		stop: integer:= 7
	);
	PORT(
		clk_i : 		IN  STD_LOGIC;
		reset_i : 	IN  STD_LOGIC;
		enable_i : 	IN  STD_LOGIC;          
		data_o : 	OUT STD_LOGIC_VECTOR(2 downto 0)
		);
	END COMPONENT;
	
	signal color : 	STD_LOGIC_VECTOR(7 downto 0);
	signal red : 		STD_LOGIC_VECTOR(2 downto 0);
	signal rst : 		STD_LOGIC;
	
begin

	Inst_counter: counter PORT MAP(
		clk_i => clk_i,
		reset_i => rst,
		enable_i => en_i,
		data_o => red
	);
	
	rst <= '1' WHEN rst_i = '1' OR gameRst_i = '1' ELSE 
            '0'; 
	
	col_o <= color;
	color(7 downto 5) <= red;
	color(4 downto 0) <= "11100";

end Behavioral;

