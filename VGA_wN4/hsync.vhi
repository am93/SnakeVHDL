
-- VHDL Instantiation Created from source file hsync.vhd -- 14:56:40 11/13/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT hsync
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;          
		hsync_o : OUT std_logic;
		hvidon_o : OUT std_logic;
		rowclk_o : OUT std_logic;
		column_o : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_hsync: hsync PORT MAP(
		clk_i => ,
		reset_i => ,
		hsync_o => ,
		hvidon_o => ,
		rowclk_o => ,
		column_o => 
	);


