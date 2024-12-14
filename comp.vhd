library ieee;
use ieee.std_logic_1164.all;

entity comp is

port(
	A,MAX: in std_logic_vector(9 downto 0);
	saida: out std_logic
);

end comp;

architecture behavior of comp is

signal DOOR: std_logic_vector(22 downto 0);

begin
--PORTAS XNOR
DOOR(0) <= A(9) xnor MAX(9);
DOOR(1) <= A(8) xnor MAX(8);
DOOR(2) <= A(7) xnor MAX(7);
DOOR(3) <= A(6) xnor MAX(6);
DOOR(4) <= A(5) xnor MAX(5);
DOOR(5) <= A(4) xnor MAX(4);
DOOR(6) <= A(3) xnor MAX(3);
DOOR(7) <= A(2) xnor MAX(2);
DOOR(8) <= A(1) xnor MAX(1);
DOOR(9) <= A(0) xnor MAX(0);

--PORTAS AND

DOOR(10) <= A(9) and not(MAX(9));
DOOR(11) <= A(8) and not(MAX(8)) and DOOR(0);
DOOR(12) <= A(7) and not(Max(7)) and DOOR(0) and DOOR(1);
DOOR(13) <= A(6) and not(MAX(6)) and DOOR(0) and DOOR(1) and DOOR(2);
DOOR(14) <= A(5) and not(MAX(5)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3);
DOOR(15) <= A(4) and not(MAX(4)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4);
DOOR(16) <= A(3) and not(MAX(3)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4) and DOOR(5);
DOOR(17) <= A(2) and not(MAX(2)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4) and DOOR(5) and DOOR(6);
DOOR(18) <= A(1) and not(MAX(1)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4) and DOOR(5) and DOOR(6) and DOOR(7);
DOOR(19) <= A(0) and not(MAX(0)) and DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4) and DOOR(5) and DOOR(6) and DOOR(7) and DOOR(8);

--PORTA OR 10 BITS
DOOR(20) <= DOOR(10) or DOOR(11) or DOOR(12) or DOOR(13) or DOOR(14) or DOOR(15) or DOOR(16) or DOOR(17) or DOOR(18) or DOOR(19);

--PORTA AND 10 BITS 
DOOR(21) <= DOOR(0) and DOOR(1) and DOOR(2) and DOOR(3) and DOOR(4) and DOOR(5) and DOOR(6) and DOOR(7) and DOOR(8) and DOOR(9); 

--PORTA OR LED
DOOR(22) <= DOOR(20) or DOOR(21);

saida <= DOOR(22);

end behavior;