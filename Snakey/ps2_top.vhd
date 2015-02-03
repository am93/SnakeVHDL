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
    Port ( clk_i : 		IN  STD_LOGIC;
           rst_i : 		IN  STD_LOGIC;
			  kbdclk : 		IN STD_LOGIC;
			  kbddata : 	IN STD_LOGIC;
			  sc_ready: 	OUT STD_LOGIC;
			  data_out: 	OUT STD_LOGIC_VECTOR(7 downto 0);
			  cathode_o: 	OUT STD_LOGIC_VECTOR(0 to 6);
			  anode_o: 		OUT STD_LOGIC_VECTOR (3 downto 0)
			  );
end ps2_top;

architecture Behavioral of ps2_top is
	-----------------------------
	---- Definicija komponent ---
	-----------------------------
	COMPONENT control_unit
		PORT(
			clk_i : 				IN STD_LOGIC;
			rst_i : 				IN STD_LOGIC;
			pulse_i : 			IN STD_LOGIC;
			sync_kbddata_i : 	IN STD_LOGIC;          
			rdy_o : 				OUT STD_LOGIC;
			shren_o : 			OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT negedge
	PORT(
		clk_i : 		IN STD_LOGIC;
		rst_i : 		IN STD_LOGIC;
		sig_i : 		IN STD_LOGIC;          
		pulse_o : 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT shiftReg
		PORT(
			clk_i : 		IN STD_LOGIC;
			rst_i : 		IN STD_LOGIC;
			enable : 	IN STD_LOGIC;
			input : 		IN STD_LOGIC;          
			data_out : 	OUT STD_LOGIC_VECTOR(8 downto 0)
		);
	END COMPONENT;
	
	COMPONENT TopModul
		PORT(
			clk_i : 		IN STD_LOGIC;
			reset_i : 	IN STD_LOGIC;
			data_i : 	IN STD_LOGIC_VECTOR(15 downto 0);          
			cathode_o : OUT STD_LOGIC_VECTOR(6 downto 0);
			anode_o : 	OUT STD_LOGIC_VECTOR(3 downto 0)
		);
	END COMPONENT;
	
	signal sync_kbdclk: 		STD_LOGIC;
	signal sync_kbddata: 	STD_LOGIC;
	signal pulse_wire : 		STD_LOGIC;
	signal shren_wire : 		STD_LOGIC;
	signal data_wire : 		STD_LOGIC_VECTOR(15 downto 0);
	signal data_val : 		STD_LOGIC_VECTOR(8 downto 0);

begin

	data_out <= data_val(7 downto 0);

	data_wire(15 downto 9) <= (others => '0');
	data_wire(8 downto 0) <= data_val;
	 
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

