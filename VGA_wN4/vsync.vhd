----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:09 11/13/2014 
-- Design Name: 
-- Module Name:    vsync - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vsync is
	Generic (
		vcount_width : integer := 10;
		pulse_width : integer := 2;
		display_time : integer := 480;
		back_porch : integer := 29;
		front_porch : integer := 10;
		scan_time : integer := 521
	);
   Port ( clk_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           cnt_enable : in  STD_LOGIC;
           vsync_o : out  STD_LOGIC;
           row_o : out  STD_LOGIC_VECTOR(vcount_width-1 downto 0);
           vvidon_o : out  STD_LOGIC);
end vsync;

architecture Behavioral of vsync is
	component counter	
		Generic (width: integer := vcount_width; stop: integer := scan_time-1);
		Port (clk_i: in STD_LOGIC; reset_i: in STD_LOGIC; enable_i: in STD_LOGIC; data_o: out STD_LOGIC_VECTOR(vcount_width-1 downto 0));
	end component;

	
	
	signal vsync: STD_LOGIC;
	signal vvidon: STD_LOGIC;
	signal row: STD_LOGIC_VECTOR(vcount_width-1 downto 0);
	
begin
	
	cnt : counter
	generic map (
		width => vcount_width,
		stop => scan_time-1
	)
	port map (
		clk_i => clk_i,
		reset_i => reset_i,
		enable_i => cnt_enable,
		data_o => row
	);
	
	vsync_o <= vsync;
	vvidon_o <= vvidon;
	row_o <= row;
	
process(clk_i, reset_i)
begin
	if (clk_i'event and clk_i='1') then
		if (reset_i='1') then
			vsync <= '0';
			vvidon <= '0';
		else
			if NOT (row > (display_time+front_porch) AND row < (display_time+front_porch+pulse_width)) then
				vsync <= '1';
			else
				vsync <= '0';
			end if;
			if (row < display_time) then
				vvidon <= '1';
			else
				vvidon <= '0';
			end if;
		end if;
	end if;

end process;
	
	

end Behavioral;

