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
    Port ( clk_m : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           kbdclk_i : in  STD_LOGIC;
           kbddata_i : in  STD_LOGIC;
           hsync_o : out  STD_LOGIC;
           vsync_o : out  STD_LOGIC;
           red_o : out  STD_LOGIC_VECTOR (2 downto 0);
           green_o : out  STD_LOGIC_VECTOR (2 downto 0);
           blue_o : out  STD_LOGIC_VECTOR (1 downto 0);
			  cathode_o : out STD_LOGIC_VECTOR (0 to 6);
			  anode_o : out STD_LOGIC_VECTOR (3 downto 0)
			  );
end snake_top;

architecture Behavioral of snake_top is
	
	COMPONENT clkgen
	PORT(
		clk_m : in     std_logic;
		clk_i : out    std_logic
	);
	END COMPONENT;
	
	COMPONENT ps2_top
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		kbdclk : IN std_logic;
		kbddata : IN std_logic;          
		sc_ready : OUT std_logic;
		data_out : OUT std_logic_vector(7 downto 0);
		cathode_o : OUT std_logic_vector(0 to 6);
		anode_o : OUT std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
	COMPONENT vga_top
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		write_enable : IN std_logic;
		column_in : IN std_logic_vector(5 downto 0);
		row_in : IN std_logic_vector(4 downto 0);
		data_in : IN std_logic;          
		hsync_o : OUT std_logic;
		vsync_o : OUT std_logic;
		red_o : OUT std_logic_vector(2 downto 0);
		green_o : OUT std_logic_vector(2 downto 0);
		blue_o : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT firmware
	PORT(
		address : IN std_logic_vector(11 downto 0);
		enable : IN std_logic;
		clk : IN std_logic;          
		instruction : OUT std_logic_vector(17 downto 0);
		rdl : OUT std_logic
		);
	END COMPONENT;
	
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
	
	-- interna ura (50MHz)
	signal clk_i:				std_logic;
	
	-- PS2 signali
	signal sc_ready: 			std_logic;
	signal scan_code: 		std_logic_vector(7 downto 0);
	
	-- VGA signali
	signal write_enable:		std_logic;
	signal row:					std_logic_vector(4 downto 0);
	signal column:				std_logic_vector(5 downto 0);
	signal data:				std_logic;
	
	-- firmware signali
	signal address :			std_logic_vector(11 downto 0);
	signal instruction :	 	std_logic_vector(17 downto 0);
	signal kcpsm_inport:		std_logic_vector(7 downto 0);
	signal kcpsm_outport:	std_logic_vector(7 downto 0);
	signal kcpsm_portid:		std_logic_vector(7 downto 0);
	signal kcpsm_enable:	 	std_logic;
	signal kcpsm_rst:			std_logic;
	signal kcpsm_int:			std_logic;
	signal kcpsm_intack:		std_logic;
	signal kcpsm_rstrobe:	std_logic;
	signal kcpsm_wstrobe:	std_logic;
	signal kcpsm_sleep:		std_logic;
	signal kcpsm_kwstr:	std_logic;
	
begin
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
					when others =>
						data <= kcpsm_outport(0);
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
			end if;
		end if;
	
	end process;


	

end Behavioral;

