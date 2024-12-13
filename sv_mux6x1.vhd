-- mux 6x1 10 bits do estado subtrair V
-- canais C, seletores S, saída Im
  
library ieee;
use ieee.std_logic_1164.all; 
 
entity sv_mux6x1 is
 port(S2, S1, S0: in std_logic;
      C5, C4, C3, C2, C1, C0: in std_logic_vector(9 downto 0);
      Im: out std_logic_vector (9 downto 0));
end sv_mux6x1;
 
architecture main of sv_mux6x1 is 
begin

	muxx: for k in 0 to 6 generate
		Im(k) <= (C5(k) and S2 and not(S1) and S0) or
         	         (C4(k) and S2 and not(S1) and not(S0)) or
         	         (C3(k) and not(S2) and S1 and S0) or
			 (C2(k) and not(S2) and S1 and not(S0)) or
		 	 (C1(k) and not(S2) and not(S1) and S0) or
		 	 (C0(k) and not(S2) and not(S1) and not(S0));
	end generate muxx;
  
end architecture;
