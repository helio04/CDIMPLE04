library ieee;
use ieee.std_logic_1164.all;

entity demux_1x6_1 is

port
(
	I, s2, s1, s0: in std_logic;
	O: out std_logic_vector(5 downto 0)

);

end demux_1x6_1;

architecture behavior of demux_1x6_1 is

begin 

O(5) <= I and s2 and not s1 and s0;
O(4) <= I and s2 and not s1 and not s0;
O(3) <= I and not s2 and s1 and s0;
O(2) <= I and not s2 and s1 and not s0;
O(1) <= I and not s2 and not s1 and s0;
O(0) <= I and not s2 and not s1 and not s0;

end behavior;