--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:59:44 11/13/2014
-- Design Name:   
-- Module Name:   C:/Users/Ajda/Documents/Projekti/VGA/vsync_test.vhd
-- Project Name:  VGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vsync
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
 
ENTITY vsync_test IS
END vsync_test;
 
ARCHITECTURE behavior OF vsync_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vsync
    PORT(
         clk_i : IN  std_logic;
         reset_i : IN  std_logic;
         cnt_enable : IN  std_logic;
         vsync_o : OUT  std_logic;
         row_o : OUT  std_logic_vector(8 downto 0);
         vvidon_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal reset_i : std_logic := '0';
   signal cnt_enable : std_logic := '0';

 	--Outputs
   signal vsync_o : std_logic;
   signal row_o : std_logic_vector(8 downto 0);
   signal vvidon_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vsync PORT MAP (
          clk_i => clk_i,
          reset_i => reset_i,
          cnt_enable => cnt_enable,
          vsync_o => vsync_o,
          row_o => row_o,
          vvidon_o => vvidon_o
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
      wait for 100 ns;	
		reset_i <= '0';
      wait for clk_i_period*100;
		cnt_enable <= '1';
		wait for 10 ns;
		cnt_enable <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
