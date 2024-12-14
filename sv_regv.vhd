-- Registrador de 10 bits com ffds e load

library ieee;
use ieee.std_logic_1164.all;

entity sv_regv is
   port(clk, ld : in std_logic;
      	d : in std_logic_vector(9 downto 0);
        q : out std_logic_vector(9 downto 0));
end entity sv_regv;

architecture main of sv_regv is

	signal inputs  : std_logic_vector(9 downto 0);
	signal outputs : std_logic_vector(9 downto 0);

	component ffd is
		port(d, clk: in std_logic;
		     q: out std_logic);
	end component;
		
begin
   
	ffs: for k in 0 to 9 generate
		inputs(k) <= (outputs(k) and not(ld)) or (d(k) and ld);
		ff: ffd port map (d => inputs(k), clk => clk,
         		       	  q => outputs(k));
	end generate ffs;
	
	q <= outputs;
   
end architecture main;
