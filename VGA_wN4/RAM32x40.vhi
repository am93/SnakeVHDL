
-- VHDL Instantiation Created from source file RAM32x40.vhd -- 15:30:21 12/18/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_RAM32x40: RAM32x40 PORT MAP(
		clk_i => ,
		we_i => ,
		addrIN_i => ,
		col_i => ,
		addrOUT_i => ,
		data_i => ,
		data_o => 
	);


