library ieee;
use ieee.std_logic_1164.all;

entity muxligar is
	port(entrada0, entrada1 : in std_logic_vector(9 downto 0);
				selector : in std_logic;
				outmuxligar : out std_logic_vector(9 downto 0));
end entity;

architecture morteedor of muxligar is
signal seletormux : std_logic_vector(9 downto 0);

begin 

seletormux <= selector&selector&selector&selector&selector&selector&selector&selector&selector&selector;
outmuxligar <= (seletormux and entrada1) or (not seletormux and entrada0);

end architecture;
