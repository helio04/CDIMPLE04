-- full adder padrão

library ieee;
use ieee.std_logic_1164.all;

entity sv_fulladder is
	port (a, b, ci: in  std_logic;
	      s, co   : out std_logic);
end entity;

architecture main of sv_fulladder is
begin
	s <= (not(a) and not(b) and ci) or (not(a) and b and not(ci)) or (a and not(b) and not(ci)) or (a and b and ci) ;
    co <= (a and b) or (ci and (a or b));
end architecture;

-- subtrator

library ieee;
use ieee.std_logic_1164.all;

entity sv_subtractor is
	port(A, B : in  std_logic_vector(9 downto 0);
		 S    : out std_logic_vector(9 downto 0));
end entity;

architecture main of sv_subtractor is
	component sv_fulladder is
		port (a, b, ci: in  std_logic;
	          s, co   : out std_logic);
	end component;

	signal carries : std_logic_vector(10 downto 0);

begin
	
	carries(0) <= '1';
    -- instanciar Adders
    Adders: for k in 0 to 9 generate
		adder: sv_fulladder port map (
			a => A(k), b => not(B(k)), ci => carries(k),
			s => S(k), co => carries(k + 1)
		);
	end generate Adders;
	
end architecture;