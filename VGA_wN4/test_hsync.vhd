--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:24 11/06/2014
-- Design Name:   
-- Module Name:   C:/Users/Ajda/Documents/Projekti/VGA/test_hsync.vhd
-- Project Name:  VGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hsync
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_hsync IS
END test_hsync;
 
ARCHITECTURE behavior OF test_hsync IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hsync
    PORT(
         clk_i : IN  std_logic;
         reset_i : IN  std_logic;
         hsync_o : OUT  std_logic;
         hvidon_o : OUT  std_logic;
         rowclk_o : OUT  std_logic;
         column_o : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal reset_i : std_logic := '0';

 	--Outputs
   signal hsync_o : std_logic;
   signal hvidon_o : std_logic;
   signal rowclk_o : std_logic;
   signal column_o : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hsync PORT MAP (
          clk_i => clk_i,
          reset_i => reset_i,
          hsync_o => hsync_o,
          hvidon_o => hvidon_o,
          rowclk_o => rowclk_o,
          column_o => column_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset_i <= '1';
		wait for 10 ns;
		reset_i <= '0';
      wait for 1000 ns;	

      wait for clk_i_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;
