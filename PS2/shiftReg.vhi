
-- VHDL Instantiation Created from source file shiftReg.vhd -- 19:35:03 12/10/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT shiftReg
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		enable : IN std_logic;
		input : IN std_logic;          
		data_out : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	Inst_shiftReg: shiftReg PORT MAP(
		clk_i => ,
		rst_i => ,
		enable => ,
		input => ,
		data_out => 
	);


