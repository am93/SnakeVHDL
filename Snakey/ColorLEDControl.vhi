
-- VHDL Instantiation Created from source file ColorLEDControl.vhd -- 17:16:40 02/01/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ColorLEDControl
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		data_i : IN std_logic_vector(15 downto 0);          
		colorLED_o : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_ColorLEDControl: ColorLEDControl PORT MAP(
		clk_i => ,
		rst_i => ,
		data_i => ,
		colorLED_o => 
	);


