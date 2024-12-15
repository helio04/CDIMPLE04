library ieee;
use ieee.std_logic_1164.all;

entity sist_demux is

port
(
	s, clear: in std_logic_vector(2 downto 0);
	c, clk: in std_logic;
	O1, O2, O3, O4, O5, O6: out std_logic_vector(9 downto 0)
);

end sist_demux;

architecture behavior of sist_demux is

component demux_1x6_1 is

port
(
	I, s2, s1, s0: in std_logic;
	O: out std_logic_vector(5 downto 0)

);

end component demux_1x6_1;

component Contador3bits is
	port(
		M : in std_logic; -- 0 up, 1 dw
		clock: in std_logic;
		clear: in std_logic;
		setar: in std_logic;
		a : out std_logic_vector(2 downto 0)
		);
end component Contador3bits;

component Contador10bits is
	port(
		M : in std_logic; -- 0 up, 1 dw
		clock: in std_logic;
		clear: in std_logic;
		setar: in std_logic;
		a : out std_logic_vector(9 downto 0)
		);
end component Contador10bits;

signal up,clr, set: std_logic;
signal q: std_logic_vector(5 downto 0);
signal saida1, saida2, saida3, saida4, saida5, saida6: std_logic_vector(9 downto 0);
signal M: std_logic_vector(2 downto 0);

begin

set <= '1';
clr <= not(not clear(2) and not clear(1) and not clear(0));
up <= not s(0) and s(1) and not s(2);

cont3bits: Contador3bits port map(c, clk, clr, set, M);

demux: demux_1x6_1 port map(up, M(2), M(1), M(0), q);
cont1: Contador10bits port map(q(5), clk, clr, set, saida1);
cont2: Contador10bits port map(q(4), clk, clr, set, saida2);
cont3: Contador10bits port map(q(3), clk, clr, set, saida3);
cont4: Contador10bits port map(q(2), clk, clr, set, saida4);
cont5: Contador10bits port map(q(1), clk, clr, set, saida5);
cont6: Contador10bits port map(q(0), clk, clr, set, saida6);

O1 <= saida1;
O2 <= saida2;
O3 <= saida3;
O4 <= saida4;
O5 <= saida5;
O6 <= saida6;

end behavior;