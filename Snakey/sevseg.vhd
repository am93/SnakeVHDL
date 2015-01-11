----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:11 10/23/2014 
-- Design Name: 
-- Module Name:    seg7 - Behavioral 
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

entity seg7 is
	Port (
		clk_i: in STD_LOGIC;
		reset_i: in STD_LOGIC;
		data_i: in STD_LOGIC_VECTOR(15 downto 0);
		refresh_i: in STD_LOGIC;
		cathode_o: out STD_LOGIC_VECTOR(6 downto 0);
		anode_o: out STD_LOGIC_VECTOR(3 downto 0)
	);
end seg7;

architecture Behavioral of seg7 is
	signal num: STD_LOGIC_VECTOR(3 downto 0);
	signal anode: STD_LOGIC_VECTOR(3 downto 0);
begin
	
	process (num)
	begin
		case num is
			when "0000" => cathode_o <= "0000001";					--0
			when "0001" => cathode_o <= "1001111";					--1
			when "0010" => cathode_o <= "0010010";					--2
			when "0011" => cathode_o <= "0000110";					--3
			when "0100" => cathode_o <= "1001100";					--4
			when "0101" => cathode_o <= "0100100";					--5
			when "0110" => cathode_o <= "0100000";					--6
			when "0111" => cathode_o <= "0001111";					--7
			when "1000" => cathode_o <= "0000000";					--8
			when "1001" => cathode_o <= "0000100";					--9
			when "1010" => cathode_o <= "0001000";					--10
			when "1011" => cathode_o <= "1100000";					--11
			when "1100" => cathode_o <= "0110001";					--12
			when "1101" => cathode_o <= "1000010";					--13
			when "1110" => cathode_o <= "0110000";					--14
			when others => cathode_o <= "0111000";					--15
		end case;
	end process;
	
	anode_o <= anode;
	
	process (clk_i, reset_i, refresh_i)
	begin
		if (clk_i'event and clk_i = '1') then
			if (refresh_i = '1') then
				if (reset_i = '1') then
					anode <= "0111";
				else
				case anode is
					when "0111" => anode <= "1011";
										num <= data_i(11 downto 8);
					when "1011" =>	anode <= "1101";
										num <= data_i(7 downto 4);
					when "1101" =>	anode <= "1110";
										num <= data_i(3 downto 0);
					when others => anode <= "0111";
										num <= data_i(15 downto 12);
			
				end case;
				end if;
			end if;
		end if;
	
	end process;
		
end Behavioral;


