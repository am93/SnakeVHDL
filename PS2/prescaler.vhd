----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:01 10/23/2014 
-- Design Name: 
-- Module Name:    prescaler - Behavioral 
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

entity prescaler is
	Generic (
		width : integer := 8;
		value : integer :=255
	);
	Port (
		clk_i: in STD_LOGIC; 
		reset_i: in STD_LOGIC;
		enable_o: out STD_LOGIC
	);
end prescaler ;

architecture Behavioral of prescaler is
	signal precnt : STD_LOGIC_VECTOR(width-1 downto 0);
	signal pulse : STD_LOGIC;
begin
	enable_o <= pulse;
	process(clk_i,reset_i)
		begin
			if (reset_i='1') then
				precnt <= (others => '0');
				pulse <= '0';
			elsif (clk_i'event and clk_i='1') then
				if (precnt = value) then
					pulse <= '1';
					precnt <= (others => '0');
				else
					pulse <= '0';
					precnt <= precnt + '1';
				end if;
			end if;
				
		end process;


end Behavioral;

