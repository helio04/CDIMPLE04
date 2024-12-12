library ieee;
use ieee.std_logic_1164.all;

entity MDE is
    port (
        ck, rst : in std_logic;
        T, X, Y, Z, W, D : in std_logic;
	L : out std_logic;
        q : out std_logic_vector(2 downto 0));
end MDE;

architecture logica of MDE is
    type estado_type is (INICIAR, LIGAR, ESPERAR, COMPARAR, SUBTRAIR, MODIFICAR_MOEDA);
    signal estado_atual, proximo_estado : estado_type;

begin
    process (ck, rst)
    begin
        if rst = '1' then
            estado_atual <= INICIAR;
        elsif rising_edge(ck) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    process (estado_atual, T, Y, Z, W, D)
    begin
        case estado_atual is
            when INICIAR =>
                if T = '1' then
                    proximo_estado <= COMPARAR;
                else
                    proximo_estado <= INICIAR;
                end if;

	    when COMPARAR =>
                if (X = '1' and Y = '1' and W = '1' and Z = '0') then
                    proximo_estado <= SUBTRAIR;
                elsif (Y = '1' and (X = '0' or W = '0') and Z = '0') then
                    proximo_estado <= MODIFICAR_MOEDA;
                elsif Z = '1' and Y = '1' then
                    proximo_estado <= ESPERAR;
                elsif Y = '0' then
                    proximo_estado <= LIGAR;
		else
		   proximo_estado <= COMPARAR; 
                end if;

 	    when SUBTRAIR =>
                proximo_estado <= COMPARAR;

            when MODIFICAR_MOEDA =>
                proximo_estado <= COMPARAR;

            when LIGAR =>
                if D = '1' then
                    proximo_estado <= INICIAR;
                else
                    proximo_estado <= LIGAR;
                end if;

            when ESPERAR =>
                if T = '1' then
                    proximo_estado <= INICIAR;
                else
                    proximo_estado <= ESPERAR;
                end if;
        end case;
    end process;

    with estado_atual select
        q <= "000" when INICIAR,
             "001" when COMPARAR, 
             "010" when SUBTRAIR,
             "011" when MODIFICAR_MOEDA,
             "100" when LIGAR,  
             "101" when ESPERAR;  

 	 L <= '1' when estado_atual = SUBTRAIR or
                       estado_atual = ESPERAR or
                       estado_atual = LIGAR or
                       estado_atual = MODIFICAR_MOEDA else '0';
end logica;