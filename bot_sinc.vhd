-- Botão sincrono

library ieee;
use ieee.std_logic_1164.all;

entity bot_sinc is
	port (cin, clk: in std_logic;
	      cout: out std_logic);
end entity;

architecture main of bot_sinc is

signal q0: std_logic;
signal q1: std_logic;
  
component ffd is
	port(d, clk: in std_logic;
	     q: out std_logic);
end component;
  
begin

ff0: ffd port map (d => ((q0 and cin) or (q1)), clk => clk,
          	   q => q0;

ff1: ffd port map (d => (not(q0) and not(q1) and cin), clk => clk,
          	   q => q1;

cout <= not(q0) and not(q1) and cin;
end architecture;
