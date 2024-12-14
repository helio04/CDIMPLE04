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
