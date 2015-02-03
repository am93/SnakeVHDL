----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:03 11/13/2014 
-- Design Name: 
-- Module Name:    vga_top - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_top is
	 Generic (
		hcount_width : integer := 11;
		vcount_width : integer := 10
	 );
    Port ( clk_i : 			IN  STD_LOGIC;
           reset_i : 		IN  STD_LOGIC;
			  write_enable:	IN  STD_LOGIC;
			  column_in: 		IN  STD_LOGIC_VECTOR(5 downto 0);
			  row_in: 			IN  STD_LOGIC_VECTOR(4 downto 0);
			  data_in:			IN	 STD_LOGIC_VECTOR(1 downto 0);
			  pulse_i: 			IN STD_LOGIC;
			  pulseRst_i: 		IN STD_LOGIC;
           hsync_o : 		OUT STD_LOGIC;
           vsync_o : 		OUT STD_LOGIC;
			  red_o: 			OUT STD_LOGIC_VECTOR(2 downto 0);
			  green_o: 			OUT STD_LOGIC_VECTOR(2 downto 0);
			  blue_o: 			OUT STD_LOGIC_VECTOR(1 downto 0)
			  );
end vga_top;

architecture Behavioral of vga_top is
	COMPONENT hsync
		GENERIC (hcount_width : integer := 11; 
					sync_pulse : 	integer := 192; 
					display_time : integer := 1280; 
					front_porch : 	integer := 32; 
					back_porch : 	integer := 96; 
					scan_time : 	integer := 1600; 
					column_width : integer := 10
		);
		PORT (clk_i : 		IN STD_LOGIC; 
				reset_i : 	IN STD_LOGIC; 
				hsync_o : 	OUT STD_LOGIC; 
				hvidon_o : 	OUT STD_LOGIC; 
				rowclk_o : 	OUT STD_LOGIC; 
				column_o : 	OUT STD_LOGIC_VECTOR (column_width -1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT vsync	
		GENERIC (vcount_width : integer := vcount_width; 
					pulse_width : 	integer := 2; 
					display_time : integer := 480; 
					front_porch : 	integer := 10; 
					back_porch : 	integer := 29; 
					scan_time : 	integer := 521
		);
		PORT (clk_i : 			IN STD_LOGIC; 
				reset_i : 		IN STD_LOGIC; 
				cnt_enable : 	IN STD_LOGIC;	
				vsync_o : 		OUT STD_LOGIC; 
				row_o : 			OUT STD_LOGIC_VECTOR(vcount_width-1 downto 0);
				vvidon_o : 		OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT RAM32x40
		PORT(
			clk_i : 		IN STD_LOGIC;
			we_i : 		IN STD_LOGIC;
			addrIN_i : 	IN STD_LOGIC_VECTOR(4 downto 0);
			col_i : 		IN STD_LOGIC_VECTOR(5 downto 0);
			addrOUT_i : IN STD_LOGIC_VECTOR(4 downto 0);
			data_i : 	IN STD_LOGIC;          
			data_o : 	OUT STD_LOGIC_VECTOR(0 to 39)
		);
	END COMPONENT;
	
	COMPONENT colorController
		PORT(
			clk_i : 		IN STD_LOGIC;
			rst_i : 		IN STD_LOGIC;
			en_i : 		IN STD_LOGIC;  
			gameRst_i : IN STD_LOGIC;
			col_o : 		OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	-- signali za VGA
	signal hvidon: 	STD_LOGIC;
	signal rowclk: 	STD_LOGIC;
	signal vvidon: 	STD_LOGIC;
	signal column: 	STD_LOGIC_VECTOR(9 downto 0);
	signal row: 		STD_LOGIC_VECTOR(vcount_width-1 downto 0);
	signal color: 		STD_LOGIC_VECTOR(7 downto 0);
	
	-- signals for RAM
	signal data_got_first: 	STD_LOGIC_VECTOR(39 downto 0);
	signal data_got_second: STD_LOGIC_VECTOR(39 downto 0);
	signal curr_bit: 			STD_LOGIC_VECTOR(1 downto 0);
	
	-- signal za nastavljanje barve kaèe
	signal snakeColor: STD_LOGIC_VECTOR(7 downto 0);

begin
	
	Inst_hsync: hsync PORT MAP(
		clk_i => clk_i,
		reset_i => reset_i,
		hsync_o => hsync_o,
		hvidon_o => hvidon,
		rowclk_o => rowclk,
		column_o => column
	);
	
	Inst_vsync: vsync PORT MAP(
		clk_i => clk_i,
		reset_i => reset_i,
		cnt_enable => rowclk,
		vsync_o => vsync_o,
		row_o => row,
		vvidon_o => vvidon
	);
	
	-- prvi RAM 
	Inst_RAM30x40_first: RAM32x40 PORT MAP(
		clk_i => clk_i,
		we_i => write_enable,
		addrIN_i => row_in,
		col_i => column_in,
		addrOUT_i => row(8 downto 4),
		data_i => data_in(1),
		data_o => data_got_first
	);
	
	-- drugi RAM 
	Inst_RAM30x40_second: RAM32x40 PORT MAP(
		clk_i => clk_i,
		we_i => write_enable,
		addrIN_i => row_in,
		col_i => column_in,
		addrOUT_i => row(8 downto 4),
		data_i => data_in(0),
		data_o => data_got_second
	);
	
	Inst_colorController: colorController PORT MAP(
		clk_i => clk_i,
		rst_i => reset_i,
		en_i => pulse_i,
		gameRst_i => pulseRst_i,
		col_o => snakeColor
	);
	
	
	red_o <= color(7 downto 5);
	green_o <= color(4 downto 2);
	blue_o <= color(1 downto 0);
	
	process (clk_i, reset_i)
	begin
		
		if(clk_i'event and clk_i = '1') then
			if (reset_i='1') then
				color <= (others => '0');
			else
				-- bita iz RAMa
				curr_bit(1) <= data_got_first(conv_integer(column(9 downto 4)));
				curr_bit(0) <= data_got_second(conv_integer(column(9 downto 4)));
				if (hvidon='1' AND vvidon='1') then
					case(curr_bit) is
						-- barva za kaco
						when "10" =>
							--color <= "00011100";
							color <= snakeColor;		-- barva odvisna od tega koliko hrane je kaca ze pojedla
						-- barva za hrano
						when "01" =>
							color <= "11100000";
						-- barva za ozadje
						when others =>
							color <= (others => '0');
					end case;
				else
					color <= (others => '0');
				end if;
			end if;
		end if;
	end process;
	


end Behavioral;

