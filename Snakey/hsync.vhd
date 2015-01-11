----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:25 11/06/2014 
-- Design Name: 
-- Module Name:    hsync - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hsync is
	Generic (
		-- this values depend on the input clq frequency and
		-- scan frequency. The following are
		-- for the 50 MHz clk and 60 Hz scan frequency
		hcount_width : integer := 11;
		sync_pulse : integer := 192; -- 3.84 us
		display_time : integer := 1280; -- 25.6 us
		front_porch : integer := 96; -- 1.92 us
		back_porch : integer := 32; -- 640 ns
		scan_time : integer := 1600; -- 32.0 us
		column_width : integer := 10
	);
	Port ( 
		clk_i : in STD_LOGIC;
		reset_i : in STD_LOGIC;
		hsync_o : out STD_LOGIC;
		hvidon_o : out STD_LOGIC;
		rowclk_o : out STD_LOGIC;
		column_o : out STD_LOGIC_VECTOR ( column_width -1 downto 0)
	);
end hsync;


architecture Behavioral of hsync is
	component counter	
		Generic (width: integer := hcount_width; stop: integer := scan_time-1);
		Port (clk_i: in STD_LOGIC; reset_i: in STD_LOGIC; enable_i: in STD_LOGIC; data_o: out STD_LOGIC_VECTOR(hcount_width-1 downto 0));
	end component;
	
	signal enable: STD_LOGIC;
	signal hsync: STD_LOGIC;
	signal rowclk: STD_LOGIC;
	signal hvidon: STD_LOGIC;
	signal column: STD_LOGIC_VECTOR(column_width - 1 downto 0);
	signal count: STD_LOGIC_VECTOR(hcount_width - 1 downto 0);
begin

cnt : counter
	generic map (
		width => hcount_width,
		stop => scan_time - 1
	)
	port map (
		clk_i => clk_i,
		reset_i => reset_i,
		enable_i => enable,
		data_o => count
	);
	
	enable <= '1';
	hsync_o <= hsync;
	rowclk_o <= rowclk;
	hvidon_o <= hvidon;
	column_o <= column;

process(count)
begin
	if ((count > (display_time + front_porch) AND count < (display_time+front_porch+sync_pulse))) then
		hsync <= '0';
	else
		hsync <= '1';
	end if;
	if (count < display_time) then
		column <= count(column_width downto 1);
	else
		column <= (others => '0');
	end if;
	if (count = scan_time - 1) then
		rowclk <= '1';
	else
		rowclk <= '0';
	end if;
	if (count < display_time) then
		hvidon <= '1';
	else
		hvidon <= '0';
	end if;

end process;




end Behavioral;

