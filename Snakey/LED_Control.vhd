----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:53 01/31/2015 
-- Design Name: 
-- Module Name:    LED_Control - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Control is
    Port ( clk_i : 		IN  STD_LOGIC;
           rst_i :		IN  STD_LOGIC;
           enable_i : 	IN  STD_LOGIC_VECTOR (1 downto 0);
			  ledRst_i : 	IN  STD_LOGIC;
           led_o : 		OUT STD_LOGIC_VECTOR (15 downto 0);
			  pulse_o: 		OUT STD_LOGIC;
			  pulseRst_o: 	OUT STD_LOGIC
		);
end LED_Control;

architecture Behavioral of LED_Control is

	-- signali za pomnilno celico LED
	signal led : 		STD_LOGIC_VECTOR(15 downto 0);
	signal insert : 	STD_LOGIC;
	
	-- signali za avtomat
	type state_type is (s0,s1,s2); 
   signal state, next_state : state_type; 
	signal pulse : STD_LOGIC;  					
	signal sig   : STD_LOGIC_VECTOR(1 downto 0); 
	
	-- signali za avtomat resetiranje stevila ledic
	signal pulseRst : STD_LOGIC;  					
	
	-- negedge za resetiranje
	COMPONENT negedge
	PORT(
		clk_i : 		IN STD_LOGIC;
		rst_i : 		IN STD_LOGIC;
		sig_i : 		IN STD_LOGIC;          
		pulse_o : 	OUT STD_LOGIC
		);
	END COMPONENT;
	
begin
	
	-- instanca negedge za resteiranje ledic
	Inst_negedge_rst: negedge PORT MAP(
		clk_i => clk_i,
		rst_i => rst_i,
		sig_i => ledRst_i,
		pulse_o => pulseRst
	);

	-- notranja signala za ledice
	sig <= enable_i;
	led_o <= led;
	pulse_o <= pulse;
	pulseRst_o <= pulseRst;

	process (clk_i)
	begin
		if clk_i'event and clk_i='1' then  
			if rst_i='1' or pulseRst ='1' then   
				led <= (others => '0');
				insert <= '0';
			else
				if pulse = '1' then
					led(15 downto 1) <= led(14 downto 0);
					led(0) <= insert;
					insert <= '1';
				else
					led <= led;
				end if;
			end if;
		end if;
		
	end process;
	
	
	-------- A V T O M A T ----------

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
            if sig = "01" then
               next_state <= s1;
            end if;
         when s1 =>
            next_state <= s2;
         when s2 =>
            if sig = "00" or sig = "10" or sig = "11" then
               next_state <= s0;
            end if;
         when others =>
            next_state <= state;
      end case;      
   end process;
	



end Behavioral;

