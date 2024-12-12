library ieee;
use ieee.std_logic_1164.all;

entity mux is

port(
	v1,v0, key: in std_logic;
	s: out std_logic
);

end mux;

architecture behavior of mux is

signal d1, d0: std_logic;

begin 

d1 <= v1 and key;
d0 <= v0 and not key;
s <= d1 or d0;

end behavior;