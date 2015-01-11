
-- VHDL Instantiation Created from source file ps2_top.vhd -- 16:38:50 01/11/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ps2_top
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		kbdclk : IN std_logic;
		kbddata : IN std_logic;          
		sc_ready : OUT std_logic;
		data_out : OUT std_logic_vector(7 downto 0);
		cathode_o : OUT std_logic_vector(0 to 6);
		anode_o : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_ps2_top: ps2_top PORT MAP(
		clk_i => ,
		rst_i => ,
		kbdclk => ,
		kbddata => ,
		sc_ready => ,
		data_out => ,
		cathode_o => ,
		anode_o => 
	);


