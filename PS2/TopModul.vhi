
-- VHDL Instantiation Created from source file TopModul.vhd -- 13:01:54 12/11/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT TopModul
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		data_i : IN std_logic_vector(15 downto 0);          
		cathode_o : OUT std_logic_vector(6 downto 0);
		anode_o : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_TopModul: TopModul PORT MAP(
		clk_i => ,
		reset_i => ,
		data_i => ,
		cathode_o => ,
		anode_o => 
	);


