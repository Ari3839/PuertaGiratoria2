library ieee;
use ieee.std_logic_1164.all;

entity p7 is
port(clk,rst,echo: in std_logic;
	  trig: out std_logic;
	  led: out std_logic
	  );
end entity;

architecture arq of p7 is
signal clkl1,clkl2,tr: std_logic;
signal frec : integer;
begin
	u1: entity work.divf(arqdivf) generic map(25) port map(clk,clkl1); -- 1 MHz -> 1 us
	u2: entity work.senal(arqsenal) port map(clk,clkl2); --pwm
	u3: entity work.trigger(arqtrg) port map(clkl2,rst,echo,tr);
	trig<=tr;
	u4: entity work.contador(arqcnt) port map(echo,clkl1,tr,led);
end architecture;