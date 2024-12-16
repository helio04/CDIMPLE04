library ieee;
use ieee.std_logic_1164.all;

entity e_comparar is

port
(
	M: in std_logic_vector(2 downto 0);
	V: in std_logic_vector(9 downto 0);
	Im: in std_logic_vector(6 downto 0);
	C: in std_logic_vector(5 downto 0);
	X, Y, W, Z: out std_logic
);

end e_comparar;

architecture behavior of e_comparar is

component comp is

port(
	A,MAX: in std_logic_vector(9 downto 0);  -- compara se é maior ou igual
	saida: out std_logic
);

end component comp;

signal sete: std_logic_vector(2 downto 0);
signal a: std_logic_vector(9 downto 0);
signal socorro: std_logic;

begin

a <= ("000" & Im(6 downto 0));
sete <= "101";
comparador: comp port map(a, V, socorro);

Z <= (M(2) and sete(2)) or (M(1) and sete(1)) or (M(0) and sete(0));
Y <= V(9) or V(8) or V(7) or V(6) or V(5) or V(4) or V(3) or V(2) or V(1) or V(0);
X <= C(5) or C(4) or C(3) or C(2) or C(1) or C(0);
w <= not socorro;

end behavior;

