----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:15 02/01/2015 
-- Design Name: 
-- Module Name:    ColorLEDControl - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ColorLEDControl is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
           data_i : in  STD_LOGIC_VECTOR (15 downto 0);
           colorLED_o : out  STD_LOGIC_VECTOR (1 downto 0));
end ColorLEDControl;

architecture Behavioral of ColorLEDControl is
	-- notranji signali
	signal counter  : STD_LOGIC_VECTOR(14 downto 0); -- stevec do 25 000 (200Hz)
	signal highTime : STD_LOGIC_VECTOR(15 downto 0); -- cas signala v visokem stanju
	signal colorLED : STD_LOGIC_VECTOR(1 downto 0);
	
begin
	
	colorLED_o <= colorLED;

	process(clk_i,rst_i,data_i)
		begin
			-- stevilo pojedenih hran
			case(data_i) is
				when X"0001" =>
					highTime <= X"0400";
				when X"0003" =>
					highTime <= X"0800";
				when X"0007" =>
					highTime <= X"0C00";
				when X"000F" =>
					highTime <= X"1000";
				when X"001F" =>
					highTime <= X"1400";
				when X"003F" =>
					highTime <= X"1800";
				when X"007F" =>
					highTime <= X"1C00";
				when X"00FF" =>
					highTime <= X"2000";
				when X"01FF" =>
					highTime <= X"2400";
				when X"03FF" =>
					highTime <= X"2800";
				when X"07FF" =>
					highTime <= X"2C00";
				when X"0FFF" =>
					highTime <= X"3000";
				when X"1FFF" =>
					highTime <= X"3400";
				when X"3FFF" =>
					highTime <= X"3800";
				when X"7FFF" =>
					highTime <= X"3C00";
				when X"FFFF" =>
					highTime <= X"4000";
				when others =>
					highTime <= X"0000";
			end case;
			-- ohranjanje stanja
			colorLED <= colorLED;
		
			if (rst_i='1') then
				counter <= (others => '0');
				highTime <= (others => '0');
			elsif (clk_i'event and clk_i='1') then
			
				if (counter < highTime) then 	-- modra je prizgana 4% do 66% casa
					colorLED <= "10";
				elsif(counter < X"4000") then -- moznost za zeleno "01"
					colorLED <= "00";
				else
					colorLED <= "00";
				end if;
				
				-- povecaj counter
				if(counter = X"61A8") then  
					counter <= (others => '0');
				else
					counter <= counter + 1;
				end if;
				
			end if;
				
	end process;


end Behavioral;

