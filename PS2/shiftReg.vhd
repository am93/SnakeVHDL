----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:20 12/04/2014 
-- Design Name: 
-- Module Name:    shiftReg - Behavioral 
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

entity shiftReg is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           input : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (8 downto 0));
end shiftReg;

architecture Behavioral of shiftReg is

	signal data : STD_LOGIC_VECTOR (8 downto 0);

begin

	data_out <= data;

	process (clk_i)
	begin
		if clk_i'event and clk_i='1' then
			if rst_i='1' then
				data <= (others => '0');
			elsif enable = '1' then
				data(7 downto 0) <= data(8 downto 1);
				data(8) <= input;
			else
				data <= data;
			end if;
		end if;
	end process;
	
	

end Behavioral;

