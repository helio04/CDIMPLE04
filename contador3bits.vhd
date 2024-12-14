library ieee;
use ieee.std_logic_1164.all;

entity Contador3bits is
	port(
		M : in std_logic; -- 0 up, 1 dw
		clock: in std_logic;
		clear: in std_logic;
		setar: in std_logic;
		a : out std_logic_vector(2 downto 0)
		);
end Contador3bits;

architecture main  of Contador3bits is

signal up, down : std_logic_vector(2 downto 0);
signal combJK : std_logic_vector(1 downto 0);

signal atemp : std_logic_vector(2 downto 0);


component ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end component;


begin	

Count1: ffjk
	port map(
		ck => clock,
		clr=> clear,
		set=> setar,
		j => '1',
		k => '1',
		q => atemp(0) 
		);
		
	
up(0) <= (not M) and(atemp(0));
down(0) <=(M) and( not atemp(0));
combJK(0) <=up(0) OR down(0);
	
Count2: ffjk
	port map(
		ck => clock,
		clr=> clear,
		set=> setar,
		j => combJK(0),
		k => combJK(0),
		q => atemp(1) 
		);
		
up(1)   <=  up(0) and(atemp(1));
down(1) <= down(0) and( not atemp(1));
combJK(1) <=up(1) OR down(1);
		
Count3: ffjk
	port map(
		ck => clock,
		clr=> clear,
		set=> setar,
		j => combJK(1),
		k => combJK(1),
		q => atemp(2) 
		);	
		
a(0)<= atemp(0);
a(1)<= atemp(1);
a(2)<= atemp(2);
	
end main;	

		