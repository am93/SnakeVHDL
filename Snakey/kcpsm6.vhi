
-- VHDL Instantiation Created from source file kcpsm6.vhd -- 12:05:56 01/16/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT kcpsm6
	PORT(
		instruction : IN std_logic_vector(17 downto 0);
		in_port : IN std_logic_vector(7 downto 0);
		interrupt : IN std_logic;
		sleep : IN std_logic;
		reset : IN std_logic;
		clk : IN std_logic;          
		address : OUT std_logic_vector(11 downto 0);
		bram_enable : OUT std_logic;
		out_port : OUT std_logic_vector(7 downto 0);
		port_id : OUT std_logic_vector(7 downto 0);
		write_strobe : OUT std_logic;
		k_write_strobe : OUT std_logic;
		read_strobe : OUT std_logic;
		interrupt_ack : OUT std_logic
		);
	END COMPONENT;

	Inst_kcpsm6: kcpsm6 PORT MAP(
		address => ,
		instruction => ,
		bram_enable => ,
		in_port => ,
		out_port => ,
		port_id => ,
		write_strobe => ,
		k_write_strobe => ,
		read_strobe => ,
		interrupt => ,
		interrupt_ack => ,
		sleep => ,
		reset => ,
		clk => 
	);


