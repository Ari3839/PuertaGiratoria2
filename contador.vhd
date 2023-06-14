library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(echo,clk,rst: in std_logic;
	  led: out std_logic;
	  conteo: out integer range 0 to 1500);
end entity;

architecture arqcnt of contador is
signal cont: integer range 0 to 1500;
begin
	process(echo)
		begin
			if(rst='1') then
				cont<=0;
			elsif((rising_edge(clk))) then
				if(echo='1') then
					cont<= cont+1;
				else
					if((cont>=1)and(cont<=294)) then --menor a 5cm
						led<='1';
					else
						led<='0';
					end if;
				end if; 
			end if;
		end process;
	conteo<=cont;
end architecture;