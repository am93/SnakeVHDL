library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM32x40 is
    Port ( clk_i 		: in  STD_LOGIC;
           we_i 		: in  STD_LOGIC;
           addrIN_i 	: in  STD_LOGIC_VECTOR (4 downto 0);
			  col_i		: in 	STD_LOGIC_VECTOR (5 downto 0);
           addrOUT_i : in  STD_LOGIC_VECTOR (4 downto 0);
           --data_i 	: in  STD_LOGIC_VECTOR (0 to 39);
			  data_i 	: in STD_LOGIC;
           data_o 	: out  STD_LOGIC_VECTOR (0 to 39));
end RAM32x40;

architecture Behavioral of RAM32x40 is

	type ram_type is array (29 downto 0) of std_logic_vector (0 to 39);
   signal RAM : ram_type;
	signal dataOUT : STD_LOGIC_VECTOR (0 to 39);
	signal my_row : STD_LOGIC_VECTOR (0 to 39);

begin
	
	data_o	<= dataOUT;


	-- to je dvokanalni RAM. Pisemo na naslov addrIN_i, istocasno lahko beremo z naslova addrOUT_i
	-- RAM ima asinhronski bralni dostop, tako da ga je easy za uporabit. Ko naslovis, takoj dobis podatke.
	-- pisalni dostop je sinhronski.
	-- Pazi LSB bit je skrajno levi, zato da se lazje 'ujema' z organizacijo zaslona!

	process (clk_i)
	begin
		if (clk_i'event and clk_i = '1') then
			if (we_i = '1') then
				my_row <= RAM(conv_integer(addrIN_i));
				my_row(conv_integer(col_i)) <= data_i;
				RAM(conv_integer(addrIN_i)) <= my_row;
			end if;
		end if;
	end process;

	dataOUT <= RAM(conv_integer(addrOUT_i));


end Behavioral;

