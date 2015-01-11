----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:28 12/04/2014 
-- Design Name: 
-- Module Name:    ps2_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE. STD_LOGIC_ARITH. ALL;
use IEEE. STD_LOGIC_UNSIGNED. ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2_top is
    Port ( clk_m : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
			  kbdclk : in STD_LOGIC;
			  kbddata : in STD_LOGIC;
			  sc_ready: out STD_LOGIC;
			  data_out: out STD_LOGIC_VECTOR(8 downto 0);
			  cathode_o: out STD_LOGIC_VECTOR(0 to 6);
			  anode_o: out STD_LOGIC_VECTOR (3 downto 0)
			  );
end ps2_top;

architecture Behavioral of ps2_top is
	-----------------------------
	---- Definicija komponent ---
	-----------------------------
	component clk_gen
	port
	 (-- Clock in ports
	  clk_i           : in     std_logic;
	  -- Clock out ports
	  clk_50Mhz          : out    std_logic
	 );
	end component;
	
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
	
	COMPONENT negedge
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		sig_i : IN std_logic;          
		pulse_o : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT shiftReg
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		enable : IN std_logic;
		input : IN std_logic;          
		data_out : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;
	
	COMPONENT TopModul
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		data_i : IN std_logic_vector(15 downto 0);          
		cathode_o : OUT std_logic_vector(6 downto 0);
		anode_o : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal sync_kbdclk: STD_LOGIC;
	signal sync_kbddata: STD_LOGIC;
	signal clk_i: STD_LOGIC;
	signal pulse_wire : STD_LOGIC;
	signal shren_wire : STD_LOGIC;
	signal data_wire : STD_LOGIC_VECTOR(15 downto 0);
	signal data_val : STD_LOGIC_VECTOR(8 downto 0);

begin

	data_out <= data_val;

	data_wire(15 downto 9) <= (others => '0');
	data_wire(8 downto 0) <= data_val;

-- generator 50Mhz ure --
clk_generator : clk_gen
  port map
   (-- Clock in ports
    clk_i => clk_m,
    -- Clock out ports
    clk_50Mhz => clk_i);
	 
-- kontrolna enota --
	Inst_control: control_unit PORT MAP(
		clk_i => clk_i,						-- ura
		rst_i => rst_i, 						-- reset
		pulse_i => pulse_wire,					-- pulse iz negedge
		sync_kbddata_i => sync_kbddata,	-- syncana kbddata iz D pomnilne
		rdy_o => sc_ready,					-- izhod ready
		shren_o => shren_wire				-- izhod enable shift register
	);
	
-- negative edge detector --
	Inst_negedge: negedge PORT MAP(
		clk_i => clk_i,						-- ura
		rst_i => rst_i,						-- reset
		sig_i => sync_kbdclk,				-- syncan kbd clk
		pulse_o => pulse_wire				-- izhod pulse
	);
	
-- shift register --
	Inst_shiftReg: shiftReg PORT MAP(
		clk_i => clk_i,						-- ura
		rst_i => rst_i,						-- reset
		enable => shren_wire,				-- enable, ki pride iz kontrolne enote
		input => sync_kbddata,				-- input je sycana keyboard data
		data_out => data_val					-- izhod iz modula
	);
	
-- top modul za 7 seg --
	Inst_TopModul: TopModul PORT MAP(
		clk_i => clk_i,
		reset_i => rst_i,
		data_i => data_wire,
		cathode_o => cathode_o,
		anode_o => anode_o
	);


-- D pomnilna celica za kbdclk --
process (clk_i)
begin
   if clk_i'event and clk_i='1' then  
      sync_kbdclk <= kbdclk;
   end if;
end process;

-- D pomnilna celica za kbddata --
process (clk_i)
begin
   if clk_i'event and clk_i='1' then  
      sync_kbddata <= kbddata;
   end if;
end process;


end Behavioral;

