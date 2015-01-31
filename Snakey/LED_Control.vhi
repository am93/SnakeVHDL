
-- VHDL Instantiation Created from source file LED_Control.vhd -- 18:33:26 01/31/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT LED_Control
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		enable_i : IN std_logic_vector(1 downto 0);          
		led_o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_LED_Control: LED_Control PORT MAP(
		clk_i => ,
		rst_i => ,
		enable_i => ,
		led_o => 
	);


