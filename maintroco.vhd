library ieee;
use ieee.std_logic_1164.all;

entity maintroco is
	port (
		clk     : in std_logic;
		clear   : in std_logic_vector(2 downto 0);
		T       : in std_logic;
		s       : in std_logic_vector(2 downto 0);
		V       : in std_logic_vector(9 downto 0);
		Iout    : out std_logic_vector(5 downto 0);
		x,y,z,w,D : out std_logic
	);
end maintroco;

architecture main  of maintroco is

--signal aquis
signal subout : std_logic_vector(9 downto 0);
signal muxout : std_logic_vector(9 downto 0);
signal regout : std_logic_vector(9 downto 0);
signal bs     : std_logic;
-- fazer signal para M
signal M      : std_logic_vector(2 downto 0);
signal valSub : std_logic_vector(9 downto 0);

signal stemp : std_logic_vector(2 downto 0);
signal xtemp : std_logic;
signal ytemp : std_logic;
signal ztemp : std_logic;
signal wtemp : std_logic;

signal sinalligar : std_logic;

signal M1,M2,M3,M4,M5,M6 : std_logic_vector( 5 downto 0);

 


component sv_subtractor is
	port(A, B: in  std_logic_vector(9 downto 0);
	     S: out std_logic_vector(9 downto 0));
end component;

component sv_regv is
   port(clk, ld : in std_logic;
      	d : in std_logic_vector(9 downto 0);
        q : out std_logic_vector(9 downto 0));
end component;

component  sv_mux6x1   is
 port(S2, S1, S0: in std_logic;
      C5, C4, C3, C2, C1, C0: in std_logic_vector(9 downto 0);
      Im: out std_logic_vector (9 downto 0));
end component;


component sv_mux2x1 is
 port(S: in std_logic;
      C1, C0: in std_logic_vector(9 downto 0);
      V: out std_logic_vector (9 downto 0));
end component;

component bot_sinc is
	port (cin, clk: in std_logic;
	      cout: out std_logic);
end component;


component sist_demux is
	port(
		s, clear: in std_logic_vector(2 downto 0);
		c, clk: in std_logic;
		O1, O2, O3, O4, O5, O6: out std_logic_vector(9 downto 0)
);

end component;

component e_comparar is
	port(
		M: in std_logic_vector(2 downto 0);
		V: in std_logic_vector(9 downto 0);
		Im: in std_logic_vector(6 downto 0);
		C: in std_logic_vector(5 downto 0);
		X, Y, W, Z: out std_logic
);

end component;

component sligar is
	port(inQ1, inQ2,inQ3,inQ4,inQ5, inQ6 : in std_logic_vector(9 downto 0);
		estadoligar,clk : in std_logic;
		D : out std_logic;
		outI : out std_logic_vector(5 downto 0));
end component;



begin 

BSinc : bot_sinc
	port map (
			cin =>T,
			clk => clk,
			cout=> bs
	);

MUXV : sv_mux2x1
		port map(
				S => (not s(0) and not s(1) and not s(2)) and(BS),
				C0=> V,
				C1=> subout,
				V=> muxout
		);
		
Reg: sv_regv
		port map(
				clk=> clk,
				ld => (not s(0) and s(1) and not s(2))  OR  bs,
				d  => muxout,
				q  => regout
		);

MUXMOEDAS: sv_mux6x1
		port map(
				S2 => M(2),
				S1 => M(1),
				S0 => M(0),
				C5 => "0000001",
				C4 => "0000101",
				C3 => "0001010",
				C2 => "0011001",
				C1 => "0110010",
				C0 => "1100100",
				Im => valsub
				);

Subtrair : sv_subtractor
		port map(
				A=>regout,
				B=> valSub,
				S=>subout
				);
				
				
-- colocar subout (V) e valsub no C
-- colocar saída MM no M
-- conectar  sist demux com sligar
-- s ligar outI => Iout de  maintroco
 --AQUI TA ERRADO
sist_demux_instance : sist_demux
port map (
    s => stemp,  
    clear => clear,  
    c => ,
	 clk => 
    O1 => M1,  
    O2 => M2,  
    O3 => M3,  
    O4 => M4,  
    O5 => M5,  
    O6 => M6
);




e_comparar_instance : e_comparar
port map (
    M => M,  
    V => subout, 
    Im => valSub,  
    C => C_signal,  -- Connect the 6-bit input
    X => xtemp,  
    Y => ytemp,  
    W => wtemp,  
    Z => ztemp  
);

sinalligar <= (stemp(2) and (not stemp(1)) and (not stemp(0)));
sligar_instance : sligar
port map (
    inQ1 => M1,
    inQ2 => M2,
    inQ3 => M3,
    inQ4 => M4,
    inQ5 => M5,
    inQ6 => M6,
    estadoligar => sinalligar , 
    clk => clk,  
    D => D,  
    outI => Iout  
);

				
end main;