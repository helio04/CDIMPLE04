library ieee;
use ieee.std_logic_1164.all;


entity somadorligar is
port(A_somador, B_somador : in std_logic_vector(9 downto 0);
		Cin_somador : in std_logic;
		S_somador : out std_logic_vector(9 downto 0));
end entity;
architecture sofrimento of somadorligar is
	signal carry : std_logic_vector(9 downto 0);
begin
S_somador(0) <= A_somador(0) xor B_somador(0) xor Cin_somador;  
    carry(0) <= (A_somador(0) and B_somador(0)) or (Cin_somador and (A_somador(0) xor B_somador(0)));
S_somador(1) <= A_somador(1) xor B_somador(1) xor carry(0);
    carry(1) <= (A_somador(1) and B_somador(1)) or (carry(0) and (A_somador(1) xor B_somador(1)));
S_somador(2) <= A_somador(2) xor B_somador(2) xor carry(1);
    carry(2) <= (A_somador(2) and B_somador(2)) or (carry(1) and (A_somador(2) xor B_somador(2)));
    S_somador(3) <= A_somador(3) xor B_somador(3) xor carry(2);
    carry(3) <= (A_somador(3) and B_somador(3)) or (carry(2) and (A_somador(3) xor B_somador(3)));

    S_somador(4) <= A_somador(4) xor B_somador(4) xor carry(3);
    carry(4) <= (A_somador(4) and B_somador(4)) or (carry(3) and (A_somador(4) xor B_somador(4)));

    S_somador(5) <= A_somador(5) xor B_somador(5) xor carry(4);
    carry(5) <= (A_somador(5) and B_somador(5)) or (carry(4) and (A_somador(5) xor B_somador(5)));

    S_somador(6) <= A_somador(6) xor B_somador(6) xor carry(5);
    carry(6) <= (A_somador(6) and B_somador(6)) or (carry(5) and (A_somador(6) xor B_somador(6)));

    S_somador(7) <= A_somador(7) xor B_somador(7) xor carry(6);
    carry(7) <= (A_somador(7) and B_somador(7)) or (carry(6) and (A_somador(7) xor B_somador(7)));
	 S_somador(8) <= A_somador(8) xor B_somador(8) xor carry(7);
	 carry(8) <= (A_somador(8) and B_somador(8)) or (carry(7) and (A_somador(8) xor B_somador(8)));
	 S_somador(9) <= A_somador(9) xor B_somador(9) xor carry(8);
	 carry(9) <= (A_somador(9) and B_somador(9)) or (carry(8) and (A_somador(9) xor B_somador(9)));
end architecture;




library ieee;
use ieee.std_logic_1164.all;

entity subtratorligar is
	port(entradaA, entradaB : in std_logic_vector(9 downto 0);
			saidasub : out std_logic_vector(9 downto 0));
end entity;

architecture terror of subtratorligar is
component somadorligar is
port(A_somador, B_somador : in std_logic_vector(9 downto 0);
		Cin_somador : in std_logic;
		S_somador : out std_logic_vector(9 downto 0));
end component;
signal notB : std_logic_vector(9 downto 0);
begin
notB <= not entradaB;
subtrator : somadorligar port map(entradaA, notB,'1', saidasub);

end architecture;