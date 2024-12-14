-- mux 2x1 10 bits do estado subtrair V
-- load ld, canais C, seletor S, saída V
  
library ieee;
use ieee.std_logic_1164.all; 
 
entity sv_mux2x1 is
 port(S: in std_logic;
      C1, C0: in std_logic_vector(9 downto 0);
      V: out std_logic_vector (9 downto 0));
end sv_mux2x1;
 
architecture main of sv_mux2x1 is 
begin

  V(0) <= (C0(0) and not(S)) or (C1(0) and S);
  V(1) <= (C0(1) and not(S)) or (C1(1) and S);
  V(2) <= (C0(2) and not(S)) or (C1(2) and S);
  V(3) <= (C0(3) and not(S)) or (C1(3) and S);
  V(4) <= (C0(4) and not(S)) or (C1(4) and S);
  V(5) <= (C0(5) and not(S)) or (C1(5) and S);
  V(6) <= (C0(6) and not(S)) or (C1(6) and S);
  V(7) <= (C0(7) and not(S)) or (C1(7) and S);
  V(8) <= (C0(8) and not(S)) or (C1(8) and S);
  V(9) <= (C0(9) and not(S)) or (C1(9) and S);
  
end architecture;
