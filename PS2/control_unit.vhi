
-- VHDL Instantiation Created from source file control_unit.vhd -- 15:52:31 12/04/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT control_unit
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		pulse_i : IN std_logic;
		sync_kbddata_i : IN std_logic;          
		rdy_o : OUT std_logic;
		shren_o : OUT std_logic
		);
	END COMPONENT;

	Inst_control_unit: control_unit PORT MAP(
		clk_i => ,
		rst_i => ,
		pulse_i => ,
		sync_kbddata_i => ,
		rdy_o => ,
		shren_o => 
	);


