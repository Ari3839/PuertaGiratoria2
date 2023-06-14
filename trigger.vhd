library ieee;
use ieee.std_logic_1164.all;

entity trigger is
port(plsi,rst,echo: in std_logic;
	  plso: out std_logic);
end entity;

architecture arqtrg of trigger is
begin
	process(plsi)
		begin
			if(rst='1') then
				plso<='0';
			elsif(echo='0') then
				plso<=plsi;
			end if;
		end process;
end architecture;