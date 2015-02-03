----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:07 12/04/2014 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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


entity control_unit is
    Port ( clk_i : 				IN  STD_LOGIC;
			  rst_i : 				IN  STD_LOGIC;
           pulse_i : 			IN  STD_LOGIC;
           sync_kbddata_i : 	IN  STD_LOGIC;
           rdy_o : 				OUT  STD_LOGIC;
           shren_o : 			OUT  STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
	type state_type is (idle, start, s0,s1,s2,s3,s4,s5,s6,s7,parity,stop); 
   signal state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine
   signal rdy : 	STD_LOGIC;  -- example output signal
	signal shren : STD_LOGIC;
   --other outputs

begin

	shren_o  <= shren;
	rdy_o <= rdy;
	
	SYNC_PROC: process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            state <= idle;
         else
            state <= next_state;
         end if;        
      end if;
   end process;
	
	OUTPUT_DECODE: process (state, pulse_i, sync_kbddata_i)
   begin
      -- idle -> start
      if (state = idle and sync_kbddata_i = '0' and pulse_i = '1') then
         rdy <= '0';
			shren <= '0';
		-- idle stay
      elsif (state = idle and sync_kbddata_i = '1') then
         rdy <= '0';
			shren <= '0';
      -- start
      elsif (state = start and pulse_i = '1') then
         rdy <= '0';
			shren <= '0';
		-- s0
      elsif (state = s0 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s1
      elsif (state = s1 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s2
      elsif (state = s2 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s3
      elsif (state = s3 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s4
      elsif (state = s4 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s5
      elsif (state = s5 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s6
      elsif (state = s6 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- s7
      elsif (state = s7 and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- parity
      elsif (state = parity and pulse_i = '1') then
         rdy <= '0';
			shren <= '1';
		-- stop
      elsif (state = stop) then
         rdy <= '1';
			shren <= '0';
      else
         rdy <= '0';
			shren <= '0';
      end if;
   end process;
	
	NEXT_STATE_DECODE: process (state, pulse_i, sync_kbddata_i)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when idle =>
            if sync_kbddata_i = '0' then
               next_state <= start;
            end if;
         when start =>
            if pulse_i = '1' then
               next_state <= s0;
            end if;
         when s0 =>
            if pulse_i = '1' then
               next_state <= s1;
            end if;
			when s1 =>
            if pulse_i = '1' then
               next_state <= s2;
            end if;
			when s2 =>
            if pulse_i = '1' then
               next_state <= s3;
            end if;
			when s3 =>
            if pulse_i = '1' then
               next_state <= s4;
            end if;
			when s4 =>
            if pulse_i = '1' then
               next_state <= s5;
            end if;
			when s5 =>
            if pulse_i = '1' then
               next_state <= s6;
            end if;
			when s6 =>
            if pulse_i = '1' then
               next_state <= s7;
            end if;
			when s7 =>
            if pulse_i = '1' then
               next_state <= parity;
            end if;
			when parity =>
            if pulse_i = '1' then
               next_state <= stop;
            end if;
         when stop =>
				next_state <= idle;
			when others =>
            next_state <= idle;
      end case;      
   end process;

end Behavioral;

