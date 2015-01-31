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
    Port ( clk_i : 			in  STD_LOGIC;
           reset_i : 		in  STD_LOGIC;
			  write_enable:	in  STD_LOGIC;
			  column_in: 		in  STD_LOGIC_VECTOR(5 downto 0);
			  row_in: 			in  STD_LOGIC_VECTOR(4 downto 0);
			  data_in:			in	 STD_LOGIC_VECTOR(1 downto 0);
           hsync_o : 		out  STD_LOGIC;
           vsync_o : 		out  STD_LOGIC;
			  red_o: 			out STD_LOGIC_VECTOR(2 downto 0);
			  green_o: 			out STD_LOGIC_VECTOR(2 downto 0);
			  blue_o: 			out STD_LOGIC_VECTOR(1 downto 0)
			  );
end vga_top;

architecture Behavioral of vga_top is
	component hsync
		Generic (hcount_width : integer := 11; sync_pulse : integer := 192; display_time : integer := 1280; front_porch : integer := 32; 
					back_porch : integer := 96; scan_time : integer := 1600; column_width : integer := 10);
		Port (clk_i : in STD_LOGIC; reset_i : in STD_LOGIC; hsync_o : out STD_LOGIC; hvidon_o : out STD_LOGIC; rowclk_o : out STD_LOGIC; 
				column_o : out STD_LOGIC_VECTOR (column_width -1 downto 0));
	end component;
	
	component vsync	
		Generic (vcount_width : integer := vcount_width; pulse_width : integer := 2; display_time : integer := 480; front_porch : integer := 10; 
					back_porch : integer := 29; scan_time : integer := 521);
		PORT(clk_i : IN std_logic; reset_i : IN std_logic; cnt_enable : IN std_logic;	vsync_o : OUT std_logic; 
					row_o : OUT std_logic_vector(vcount_width-1 downto 0);vvidon_o : OUT std_logic);
	end component;

	COMPONENT RAM32x40
	PORT(
		clk_i : IN std_logic;
		we_i : IN std_logic;
		addrIN_i : IN std_logic_vector(4 downto 0);
		col_i : IN std_logic_vector(5 downto 0);
		addrOUT_i : IN std_logic_vector(4 downto 0);
		data_i : IN std_logic;          
		data_o : OUT std_logic_vector(0 to 39)
		);
	END COMPONENT;
	
	signal hvidon: STD_LOGIC;
	signal rowclk: STD_LOGIC;
	signal vvidon: STD_LOGIC;
	signal column: STD_LOGIC_VECTOR(9 downto 0);
	signal row: STD_LOGIC_VECTOR(vcount_width-1 downto 0);
	signal color: STD_LOGIC_VECTOR(7 downto 0);
	-- signals for RAM
	signal data_got_first: STD_LOGIC_VECTOR(39 downto 0);
	signal data_got_second: STD_LOGIC_VECTOR(39 downto 0);
	signal curr_bit: STD_LOGIC_VECTOR(1 downto 0);

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
							color <= "00011100";
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

