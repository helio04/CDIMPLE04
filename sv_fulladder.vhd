-- full adder padrão

library ieee;
use ieee.std_logic_1164.all;

entity sv_fulladder is
	port (a, b, ci: in std_logic;
	      s, co: out std_logic);
end entity;

architecture main of sv_fulladder is
begin
	s <= (not(a) and not(b) and ci) or (not(a) and b and not(ci)) or (a and not(b) and not(ci)) or (a and b and ci) ;
  co <= (a and b) or (ci and (a or b));
end architecture;

-- subtrator