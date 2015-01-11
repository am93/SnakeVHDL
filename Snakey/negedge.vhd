----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:42 11/27/2014 
-- Design Name: 
-- Module Name:    negedge - Behavioral 
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
use IEEE. STD_LOGIC_1164. ALL;
use IEEE. STD_LOGIC_ARITH. ALL;
use IEEE. STD_LOGIC_UNSIGNED. ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity negedge is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
			  sig_i : in  STD_LOGIC;
			  pulse_o : out STD_LOGIC);
end negedge;

architecture Behavioral of negedge is

   type state_type is (s0,s1,s2); 
   signal state, next_state : state_type; 
	signal pulse : std_logic;  -- internal signal for output
	signal sig   : std_logic;  -- internal signal for input
	
begin

	sig <= sig_i;
	pulse_o <= pulse;

	SYNC_PROC: process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            state <= s0;
         else
            state <= next_state;
         end if;        
      end if;
   end process;
	
	OUTPUT_DECODE: process (state)
   begin
		case (state) is
         when s1 =>
            pulse <= '1';
         when others =>
            pulse <= '0';
      end case;      
   end process;
	
	NEXT_STATE_DECODE: process (state, sig)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when s0 =>
            if sig = '0' then
               next_state <= s1;
            end if;
         when s1 =>
            next_state <= s2;
         when s2 =>
            if sig = '1' then
               next_state <= s0;
            end if;
         when others =>
            next_state <= state;
      end case;      
   end process;

end Behavioral;

