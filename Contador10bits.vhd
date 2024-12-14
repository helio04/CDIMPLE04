library ieee;
use ieee.std_logic_1164.all;

entity Contador10bits is
	port(
		M : in std_logic; -- 0 up, 1 dw
		clock: in std_logic;
		clear: in std_logic;
		setar: in std_logic;
		a : out std_logic_vector(9 downto 0)
		);
end Contador10bits;

architecture main  of Contador10bits is

signal up, down : std_logic_vector(8 downto 0);
signal combJK : std_logic_vector(8 downto 0);

signal atemp : std_logic_vector(9 downto 0);


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

up(2) <= up(1) and atemp(2);
down(2) <= down(1) and not atemp(2);
combJK(2) <= up(2) OR down(2);

Count4: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(2),
		k => combJK(2),
		q => atemp(3)
		);

up(3) <= up(2) and atemp(3);
down(3) <= down(2) and not atemp(3);
combJK(3) <= up(3) OR down(3);

Count5: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(3),
		k => combJK(3),
		q => atemp(4)
		);		
		
		
		
up(4) <= up(3) and atemp(4);
down(4) <= down(3) and not atemp(4);
combJK(4) <= up(4) OR down(4);

Count6: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(4),
		k => combJK(4),
		q => atemp(5)
		);
		
up(5) <= up(4) and atemp(5);
down(5) <= down(4) and not atemp(5);
combJK(5) <= up(5) OR down(5);

Count7: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(5),
		k => combJK(5),
		q => atemp(6)
		);
		
up(6) <= up(5) and atemp(6);
down(6) <= down(5) and not atemp(6);
combJK(6) <= up(6) OR down(6);

Count8: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(6),
		k => combJK(6),
		q => atemp(7)
		);
		
up(7) <= up(6) and atemp(7);
down(7) <= down(6) and not atemp(7);
combJK(7) <= up(7) OR down(7);

Count9: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(7),
		k => combJK(7),
		q => atemp(8)
		);
		
up(8) <= up(7) and atemp(8);
down(8) <= down(7) and not atemp(8);
combJK(8) <= up(8) OR down(8);

Count10: ffjk
	port map(
		ck => clock,
		clr => clear,
		set => setar,
		j => combJK(8),
		k => combJK(8),
		q => atemp(9)
		);
		
a <= atemp;
	
end main;	

		