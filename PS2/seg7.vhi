
-- VHDL Instantiation Created from source file seg7.vhd -- 13:00:37 12/11/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT seg7
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		data_i : IN std_logic_vector(15 downto 0);
		refresh_i : IN std_logic;          
		cathode_o : OUT std_logic_vector(6 downto 0);
		anode_o : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_seg7: seg7 PORT MAP(
		clk_i => ,
		reset_i => ,
		data_i => ,
		refresh_i => ,
		cathode_o => ,
		anode_o => 
	);


