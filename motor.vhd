library IEEE;
use IEEE.std_logic_1164.all;

entity motor is
    port(
        clk, asc, cs, rst, echo: in std_logic;
        snl: out std_logic_vector(3 downto 0);
		  trig: out std_logic;
		  led : buffer std_logic
    );
end entity;

architecture arq of motor is    
signal clkla,clklb,clklc : std_logic;
signal state : std_logic_vector(1 downto 0);
begin
	u0 : entity work.p7(arq) port map(clk,rst,echo,trig,led);
	u1a : entity work.divf(arqdivf) generic map(250000) port map(clk,clkla); --10 seg
	u1b : entity work.divf(arqdivf) generic map(100000) port map(clk,clklb); --4seg
	with led select
		clklc <= clkla when '1',
					clklb when others;
	u2 : entity work.states(arqstates) port map(clklc,asc,state);
	u3 : entity work.ROM(arqrom) port map(state,cs,snl);
end arq;