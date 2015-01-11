
-- VHDL Instantiation Created from source file prescaler.vhd -- 14:46:06 12/04/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT prescaler
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;          
		enable_o : OUT std_logic
		);
	END COMPONENT;

	Inst_prescaler: prescaler PORT MAP(
		clk_i => ,
		reset_i => ,
		enable_o => 
	);


