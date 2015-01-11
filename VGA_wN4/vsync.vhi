
-- VHDL Instantiation Created from source file vsync.vhd -- 15:35:44 11/20/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vsync
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		cnt_enable : IN std_logic;          
		vsync_o : OUT std_logic;
		row_o : OUT std_logic_vector(10 downto 0);
		vvidon_o : OUT std_logic
		);
	END COMPONENT;

	Inst_vsync: vsync PORT MAP(
		clk_i => ,
		reset_i => ,
		cnt_enable => ,
		vsync_o => ,
		row_o => ,
		vvidon_o => 
	);


