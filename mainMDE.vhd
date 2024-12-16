library ieee;
use ieee.std_logic_1164.all;

entity mainMDE is
	port (
		clk     : in std_logic;
		T       : in std_logic;
		V       : in std_logic_vector(9 downto 0);
		trocout : out std_logic_vector(5 downto 0);
		led     : out std_logic
	);
end mainMDE;

architecture main of mainMDE is 
 --signal 
signal stemp : std_logic_vector(2 downto 0);
signal xtemp : std_logic;
signal ytemp : std_logic;
signal ztemp : std_logic;
signal wtemp : std_logic;
signal dtemp : std_logic;
 

component maintroco is
	port (
		clk     : in std_logic;
		T       : in std_logic;
		s       : in std_logic_vector(2 downto 0);
		V       : in std_logic_vector(9 downto 0);
		Iout    : out std_logic_vector(5 downto 0);
		x,y,z,w : out std_logic
	);
end component;

component MDE is
    port (
        ck, rst : in std_logic;
        T, X, Y, Z, W, D : in std_logic;
		  L : out std_logic;
        q : out std_logic_vector(2 downto 0));
end component;


begin 

Datapath : maintroco
	port map(
		  clk    => clk,  
        T      => T,    
        s      => stemp,   
        V      => V,    
        Iout   => trocout, 
        ck     => clk,
        T      => T,
        X      => xtemp,
        Y      => ytemp,
        Z      => ztemp,
        W      => wtemp,
        D      => dtemp
	
	);
MaqEst: MDE 
	port map(
		  ck     => clk,
        T      => T,
        X      => xtemp,
        Y      => ytemp,
        Z      => ztemp,
        W      => wtemp,
        D      => dtemp,  
        L      => led,
        q      => stemp
	
	);

	

end main;

