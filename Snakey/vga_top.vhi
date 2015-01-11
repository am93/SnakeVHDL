
-- VHDL Instantiation Created from source file vga_top.vhd -- 16:47:20 01/11/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga_top
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		write_enable : IN std_logic;
		column_in : IN std_logic_vector(5 downto 0);
		row_in : IN std_logic_vector(4 downto 0);
		data_in : IN std_logic;          
		hsync_o : OUT std_logic;
		vsync_o : OUT std_logic;
		red_o : OUT std_logic_vector(2 downto 0);
		green_o : OUT std_logic_vector(2 downto 0);
		blue_o : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_vga_top: vga_top PORT MAP(
		clk_i => ,
		reset_i => ,
		write_enable => ,
		column_in => ,
		row_in => ,
		data_in => ,
		hsync_o => ,
		vsync_o => ,
		red_o => ,
		green_o => ,
		blue_o => 
	);


