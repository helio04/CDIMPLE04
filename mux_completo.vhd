library ieee;
use ieee.std_logic_1164.all;

entity mux_completo is

port(
	valor: in std_logic_vector(9 downto 0);
	key: in std_logic;
	s: out std_logic_vector(9 downto 0)
);

end mux_completo;

architecture behavior of mux_completo is

component mux is

port(
	v1,v0, key: in std_logic;
	s: out std_logic
);

end component mux;

signal zero: std_logic_vector(9 downto 0);

begin

zero <= ('0','0','0','0','0','0','0','0','0','0');

c9: mux port map(valor(9), zero(9), key, s(9));
c8: mux port map(valor(8), zero(8), key, s(8));
c7: mux port map(valor(7), zero(7), key, s(7));
c6: mux port map(valor(6), zero(6), key, s(6));
c5: mux port map(valor(5), zero(5), key, s(5));
c4: mux port map(valor(4), zero(4), key, s(4));
c3: mux port map(valor(3), zero(3), key, s(3));
c2: mux port map(valor(2), zero(2), key, s(2));
c1: mux port map(valor(1), zero(1), key, s(1));
c0: mux port map(valor(0), zero(0), key, s(0));


end behavior;
