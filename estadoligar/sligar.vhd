library ieee;
use ieee.std_logic_1164.all;


entity testemagico is
	port(inQ1, inQ2,inQ3,inQ4,inQ5, inQ6 : in std_logic_vector(9 downto 0);
		estadoligar,clk : in std_logic;
		D : out std_logic;
		outI : out std_logic_vector(5 downto 0));
end entity;

architecture mestre of testemagico is
component Comparador10 is
    port (
        A, B : in  std_logic_vector(9 downto 0);       
        AMaiorB, AMenorB, AIgualB : out std_logic
    );     
end component;
component contadorligardw is
	port(carga : in std_logic_vector(9 downto 0);
		  loadcarga : in std_logic;
		  clock : in std_logic;
		  outregister : out std_logic_vector(9 downto 0));
end component;



signal i1, i2, i3 ,i4 ,i5 ,i6, rc1,rc2,rc3,rc4,rc5,rc6, 
rz1,rz2,rz3,rz4,rz5,rz6, ri1,ri2,ri3,ri4,ri5,ri6 : std_logic;
signal saidacontador1, saidacontador2,saidacontador3,saidacontador4,
saidacontador5,saidacontador6, entradacontador1, entradacontador2,
entradacontador3,entradacontador4,entradacontador5,entradacontador6 : std_logic_vector(9 downto  0);

begin

con1 : contadorligardw port map(inQ1, estadoligar, clk, saidacontador1);
con2 : contadorligardw port map(inQ2, estadoligar, clk, saidacontador2);
con3 : contadorligardw port map(inQ3, estadoligar, clk, saidacontador3);
con4 : contadorligardw port map(inQ4, estadoligar, clk, saidacontador4);
con5 : contadorligardw port map(inQ5, estadoligar, clk, saidacontador5);
con6 : contadorligardw port map(inQ6, estadoligar, clk, saidacontador6);

c1 : comparador10 port map (saidacontador1, "0000000001", rc1, rz1, ri1);
c2 : comparador10 port map (saidacontador2, "0000000001", rc2, rz2, ri2);
c3 : comparador10 port map (saidacontador3, "0000000001", rc3, rz3, ri3);
c4 : comparador10 port map (saidacontador4, "0000000001", rc4, rz4, ri4);
c5 : comparador10 port map (saidacontador5, "0000000001", rc5, rz5, ri5);
c6 : comparador10 port map (saidacontador6, "0000000001", rc6, rz6, ri6);
i1 <= rc1 and estadoligar;
i2 <= rc2 and estadoligar;
i3 <= rc3 and estadoligar;
i4 <= rc4 and estadoligar;
i5 <= rc5 and estadoligar;
i6 <= rc6 and estadoligar;
outI <= i6&i5&i4&i3&i2&i1;
D <= rz1 and rz2 and rz3 and rz4 and rz5 and rz6 and estadoligar;

end architecture;
