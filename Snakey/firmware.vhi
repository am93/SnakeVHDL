
-- VHDL Instantiation Created from source file firmware.vhd -- 12:00:48 01/16/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT firmware
	PORT(
		address : IN std_logic_vector(11 downto 0);
		enable : IN std_logic;
		clk : IN std_logic;          
		instruction : OUT std_logic_vector(17 downto 0);
		rdl : OUT std_logic
		);
	END COMPONENT;

	Inst_firmware: firmware PORT MAP(
		address => ,
		instruction => ,
		enable => ,
		rdl => ,
		clk => 
	);


