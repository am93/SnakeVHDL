----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:06 01/11/2015 
-- Design Name: 
-- Module Name:    snake_top - Behavioral 
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

entity snake_top is
    PORT ( clk_m : 		IN  STD_LOGIC;
           reset_i : 	IN  STD_LOGIC;
           kbdclk_i : 	IN  STD_LOGIC;
           kbddata_i : 	IN  STD_LOGIC;
			  sw_i : 		IN  STD_LOGIC;
           hsync_o : 	OUT  STD_LOGIC;
           vsync_o : 	OUT  STD_LOGIC;
           red_o : 		OUT  STD_LOGIC_VECTOR (2 downto 0);
           green_o : 	OUT  STD_LOGIC_VECTOR (2 downto 0);
           blue_o : 		OUT  STD_LOGIC_VECTOR (1 downto 0);
			  cathode_o : 	OUT  STD_LOGIC_VECTOR (0 to 6);
			  anode_o : 	OUT  STD_LOGIC_VECTOR (3 downto 0);
			  led_o : 		OUT  STD_LOGIC_VECTOR(15 downto 0);
			  colorLED_o : OUT  STD_LOGIC_VECTOR (1 downto 0)
			  );
end snake_top;

architecture Behavioral of snake_top is
	
	COMPONENT clkgen
	PORT(
		clk_m : 		IN STD_LOGIC;
		clk_i : 		OUT STD_LOGIC
	);
	END COMPONENT;
	
	COMPONENT ps2_top
	PORT(
		clk_i : 			IN STD_LOGIC;
		rst_i : 			IN STD_LOGIC;
		kbdclk : 		IN STD_LOGIC;
		kbddata : 		IN STD_LOGIC;          
		sc_ready : 		OUT STD_LOGIC;
		data_out : 		OUT STD_LOGIC_VECTOR(7 downto 0);
		cathode_o : 	OUT STD_LOGIC_VECTOR(0 to 6);
		anode_o : 		OUT STD_LOGIC_VECTOR(3 downto 0)
	);
	END COMPONENT;
	
	COMPONENT vga_top
	PORT(
		clk_i : 			IN STD_LOGIC;
		reset_i :		IN STD_LOGIC;
		write_enable : IN STD_LOGIC;
		column_in : 	IN STD_LOGIC_VECTOR(5 downto 0);
		row_in : 		IN STD_LOGIC_VECTOR(4 downto 0);
		data_in : 		IN STD_LOGIC_VECTOR(1 downto 0);
		pulse_i: 		IN STD_LOGIC;
		pulseRst_i: 	IN STD_LOGIC;		
		hsync_o : 		OUT STD_LOGIC;
		vsync_o : 		OUT STD_LOGIC;
		red_o : 			OUT STD_LOGIC_VECTOR(2 downto 0);
		green_o : 		OUT STD_LOGIC_VECTOR(2 downto 0);
		blue_o : 		OUT STD_LOGIC_VECTOR(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT firmware
	PORT(
		address : 		IN STD_LOGIC_VECTOR(11 downto 0);
		enable : 		IN STD_LOGIC;
		clk : 			IN STD_LOGIC;          
		instruction : 	OUT STD_LOGIC_VECTOR(17 downto 0);
		rdl : 			OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT kcpsm6
	PORT(
		instruction : 		IN STD_LOGIC_VECTOR(17 downto 0);
		in_port : 			IN STD_LOGIC_VECTOR(7 downto 0);
		interrupt : 		IN STD_LOGIC;
		sleep : 				IN STD_LOGIC;
		reset : 				IN STD_LOGIC;
		clk : 				IN STD_LOGIC;          
		address : 			OUT STD_LOGIC_VECTOR(11 downto 0);
		bram_enable : 		OUT STD_LOGIC;
		out_port : 			OUT STD_LOGIC_VECTOR(7 downto 0);
		port_id : 			OUT STD_LOGIC_VECTOR(7 downto 0);
		write_strobe : 	OUT STD_LOGIC;
		k_write_strobe : 	OUT STD_LOGIC;
		read_strobe : 		OUT STD_LOGIC;
		interrupt_ack : 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT LED_Control
	PORT(
		clk_i : 			IN STD_LOGIC;
		rst_i : 			IN STD_LOGIC;
		enable_i : 		IN STD_LOGIC_VECTOR(1 downto 0);
		ledRst_i : 		IN STD_LOGIC;		
		led_o : 			OUT STD_LOGIC_VECTOR(15 downto 0);
		pulse_o: 		OUT STD_LOGIC;
		pulseRst_o: 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT ColorLEDControl
	PORT(
		clk_i : 			IN STD_LOGIC;
		rst_i : 			IN STD_LOGIC;
		data_i :			IN STD_LOGIC_VECTOR(15 downto 0);          
		colorLED_o : 	OUT STD_LOGIC_VECTOR(1 downto 0)
		);
	END COMPONENT;
	
	-- interna ura (50MHz)
	signal clk_i:				STD_LOGIC;
	
	-- PS2 signali
	signal sc_ready: 			STD_LOGIC;
	signal scan_code: 		STD_LOGIC_VECTOR(7 downto 0);
	
	-- VGA signali
	signal write_enable:		STD_LOGIC;
	signal row:					STD_LOGIC_VECTOR(4 downto 0);
	signal column:				STD_LOGIC_VECTOR(5 downto 0);
	signal data:				STD_LOGIC_VECTOR(1 downto 0);
	
	-- firmware signali
	signal address :			STD_LOGIC_VECTOR(11 downto 0);
	signal instruction :	 	STD_LOGIC_VECTOR(17 downto 0);
	signal kcpsm_inport:		STD_LOGIC_VECTOR(7 downto 0);
	signal kcpsm_outport:	STD_LOGIC_VECTOR(7 downto 0);
	signal kcpsm_portid:		STD_LOGIC_VECTOR(7 downto 0);
	signal kcpsm_enable:	 	STD_LOGIC;
	signal kcpsm_rst:			STD_LOGIC;
	signal kcpsm_int:			STD_LOGIC;
	signal kcpsm_intack:		STD_LOGIC;
	signal kcpsm_rstrobe:	STD_LOGIC;
	signal kcpsm_wstrobe:	STD_LOGIC;
	signal kcpsm_sleep:		STD_LOGIC;
	signal kcpsm_kwstr:		STD_LOGIC;
	
	-- signali za LED kontroler
	signal resetLED : 		STD_LOGIC;
	signal pulse :				STD_LOGIC;
	signal pulseRst: 			STD_LOGIC;
	
	-- interni signal za prenos stevila ledic
	signal internalLED :		STD_LOGIC_VECTOR(15 downto 0);
	
begin
	-- interni signal vezan na output
	led_o <= internalLED;

   -- signala za kcpsm
	kcpsm_sleep <= '0';
	
	-- hardcoded just for the sake of it
	-- write_enable <= '1';
	--row <= "01010";
	--column <= "001111";
	--data <= '1';
	
	
	clkgen_inst : clkgen
	port map(
		clk_m => clk_m,
		clk_i => clk_i
	);
	
	ps2_inst: ps2_top PORT MAP(
		clk_i => clk_i,
		rst_i => reset_i,
		kbdclk => kbdclk_i,
		kbddata => kbddata_i,
		sc_ready => sc_ready,
		data_out => scan_code,
		cathode_o => cathode_o,
		anode_o => anode_o
	);
	
	vga_inst: vga_top PORT MAP(
		clk_i => clk_i,
		reset_i => reset_i,
		write_enable => write_enable,
		column_in => column,
		row_in => row,
		data_in => data,
		pulse_i => pulse,
		pulseRst_i => pulseRst,
		hsync_o => hsync_o,
		vsync_o => vsync_o,
		red_o => red_o,
		green_o => green_o,
		blue_o => blue_o
	);
	
	Inst_firmware: firmware PORT MAP(
		address => address,
		instruction => instruction,
		enable => kcpsm_enable,
		rdl => kcpsm_rst,
		clk => clk_i
	);
	
	Inst_kcpsm6: kcpsm6 PORT MAP(
		address => address,
		instruction => instruction,
		bram_enable => kcpsm_enable,
		in_port => kcpsm_inport,
		out_port => kcpsm_outport,
		port_id => kcpsm_portid,
		write_strobe => kcpsm_wstrobe,
		k_write_strobe => kcpsm_kwstr,
		read_strobe => kcpsm_rstrobe,
		interrupt => kcpsm_int,
		interrupt_ack => kcpsm_intack,
		sleep => kcpsm_sleep,
		reset => kcpsm_rst,
		clk => clk_i
	);
	
	-- kontrola ledic pojedene hrane
	Inst_LED_Control: LED_Control PORT MAP(
		clk_i => clk_i,
		rst_i => reset_i,
		enable_i => data,		 	-- signal za povecanje stevila ledic
		ledRst_i => resetLED, 	-- signal za resetiranje ledic
		led_o => internalLED,  	-- vezan tudi na output (stevilo ledic)
		pulse_o => pulse,			-- stabiliziran signal, da je kaca pojedla hrano, ki je v visokem stanju 1 up
		pulseRst_o => pulseRst	-- stabiliziran signal za konec igre, ki je v visokem stanju 1 up
	);
	
	-- kontrola barvnih ledic
	Inst_ColorLEDControl: ColorLEDControl PORT MAP(
		clk_i => clk_i,
		rst_i => reset_i,
		data_i => internalLED,		-- stevilo prizganih ledic
		colorLED_o => colorLED_o	
	);
	
	-- proces za prekinitve
	process (clk_i)
	begin
		if(clk_i'event and clk_i = '1') then
			-- scan code ready -> prozi prekinitev
			if(sc_ready = '1') then
				kcpsm_int <= '1';
			-- prekinitev koncana
			elsif (kcpsm_intack = '1') then
				kcpsm_int <= '0';
			else
				kcpsm_int <= kcpsm_int;
			end if;
		end if;
	end process;
	
	-- proces za prejemanje podatkov (row, column, data)
	process (clk_i)
	begin
		if(clk_i'event and clk_i = '1') then
			-- assembler pise v VHDL
			if(kcpsm_wstrobe = '1') then
				-- ohrani vrednosti
				resetLED <= resetLED;
				data <= data;
				column <= column;
				row <= row;
				write_enable <= '0';
				-- dolocimo tip prihajajocega podatka
				case kcpsm_portid is
					when X"00" =>
						row <= kcpsm_outport(4 downto 0);
					when X"01" =>
						column <= kcpsm_outport(5 downto 0);
					when X"04" =>
						resetLED <= kcpsm_outport(0);
					when others =>
						data <= kcpsm_outport(1 downto 0);
						write_enable <= '1';						
				end case;
			end if;
		end if;		
	end process;
	
	-- posiljanje podatkov v assembler
	process(clk_i)
	begin
		if(clk_i'event and clk_i = '1') then
			if(kcpsm_portid = X"03") then
				kcpsm_inport <= scan_code;
			elsif (kcpsm_portid = X"05") then
				kcpsm_inport(0) <= sw_i;
			end if;
		end if;
	
	end process;


	

end Behavioral;

