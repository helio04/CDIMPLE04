-- Registrador de 10 bits com ffds e load

-- Latch D
library ieee;
use ieee.std_logic_1164.all;

entity latchd is
	port (d, clk: in std_logic;
	      q: out std_logic);
end entity;

architecture main of latchd is
begin
	process (d, clk)
	begin
		if(clk = '1') then
		   q <= d;
		end if;
	end process;
end architecture;
  
-- Flip flop D

library ieee;
use ieee.std_logic_1164.all;

entity ffd is
	port (d, clk: in std_logic;
	      q: out std_logic);
end entity;

architecture main of ffd is
	signal q_d: std_logic := '0';

	component latchd is
		port (d, clk: in std_logic;
		      q: out std_logic);
	end component;
  
begin
	
	l1: latchd port map (
		d => d, clk => not(clk), q => q_d);

	l2: latchd port map (
		d => q_d, clk => clk, q => q);
end architecture;

-- Registrador de 8 bits

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
