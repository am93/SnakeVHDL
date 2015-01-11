----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:41 10/23/2014 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
	Generic (
		width : integer := 8
	);
	Port (
		clk_i: in STD_LOGIC; 
		reset_i: in STD_LOGIC;
		enable_i: in STD_LOGIC;
		data_o: out STD_LOGIC_VECTOR(width-1 downto 0)
	);
end counter ;

architecture Behavioral of counter is
	signal count : STD_LOGIC_VECTOR(width-1 downto 0);
begin
	data_o <= count;
	
	process(enable_i,clk_i)
	begin
		if (enable_i='1' and clk_i'event and clk_i='1') then
			if (reset_i='1') then
				count <= (others => '0');
			else
				count <= count + '1';
			end if ;
		end if ;
	end process;

end Behavioral;

