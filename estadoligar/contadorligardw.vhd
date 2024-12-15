library ieee;
use ieee.std_logic_1164.all;

entity contadorligardw is
	port(carga : in std_logic_vector(9 downto 0);
		  loadcarga : in std_logic;
		  clock : in std_logic;
		  outregister : out std_logic_vector(9 downto 0));
end entity;

architecture mausoleu of contadorligardw is
component registrador10bits is
	port(cin: in std_logic_vector(9 downto 0);
		  clk: in std_logic;
	     clear: in std_logic;
		  cout: out std_logic_vector(9 downto 0));
end component;

component muxligar is
	port(entrada0, entrada1 : in std_logic_vector(9 downto 0);
				selector : in std_logic;
				outmuxligar : out std_logic_vector(9 downto 0));
end component;
component subtratorligar is
	port(entradaA, entradaB : in std_logic_vector(9 downto 0);
			saidasub : out std_logic_vector(9 downto 0));
end component;
signal entradaregistrador, saidaregistrador,saidasubtrator, saidamuxcarga : std_logic_vector(9 downto 0) := "0000000000";
--signal zeroselector, zeromaker : std_logic := '0';
begin

reg : registrador10bits port map(entradaregistrador, clock, '1', saidaregistrador);
decre : subtratorligar port map(saidaregistrador, "0000000001", saidasubtrator);
muxreg : muxligar port map(carga, saidasubtrator, loadcarga, entradaregistrador);
--muxsaida : muxligar port map(saidaregistrador, "0000000000", zeromaker, outregister);
outregister <= saidaregistrador;
end architecture;