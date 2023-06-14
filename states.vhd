library IEEE;
use IEEE.std_logic_1164.all;

entity states is
    port(
        clk, asc : in std_logic;
        estado: out std_logic_vector(1 downto 0)
    );
end entity;

architecture arqstates of states is
    subtype state is std_logic_vector(1 downto 0);
    constant s0 : state := "00";
    constant s1 : state := "01";
    constant s2 : state := "10";
    constant s3 : state := "11";
    signal actual : state := s0;
    signal siguiente : state := s1;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            actual <= siguiente;
            estado <= actual;
        end if;
    end process;

    process(actual,asc)
    begin
        case actual is
        when s0 =>
            if(asc = '1') then
                siguiente <= s1;
            else
                siguiente <= s3;
            end if;
        when s1 =>
            if(asc = '1') then
                siguiente <= s2;
            else
                siguiente <= s0;
            end if;
        when s2 =>
            if(asc = '1') then
                siguiente <= s3;
            else
                siguiente <= s1;
            end if;
        when s3 =>
            if(asc = '1') then
                siguiente <= s0;
            else
                siguiente <= s2;
            end if;
        end case;
    end process;       
end arqstates;