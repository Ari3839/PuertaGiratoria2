library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity rom is port(
	bus_dir: in std_logic_vector(1 downto 0);
	cs: in std_logic;
	bus_data: out std_logic_vector (3 downto 0)
);
end rom;

architecture arqrom of rom is 
constant L0: std_logic_vector(3 downto 0):="1100";
constant L1: std_logic_vector(3 downto 0):="0110";
constant L2: std_logic_vector(3 downto 0):="0011";
constant L3: std_logic_vector(3 downto 0):="1001";

type memoria is array (3 downto 0) of std_logic_vector(3 downto 0);
constant mem_rom : memoria := (L3,L2,L1,L0);

signal dato: std_logic_vector (3 downto 0);

begin
	prom: process (bus_dir)
	begin
		dato <= mem_rom( conv_integer (bus_dir));
			end process prom;
	
	pbuf: process (dato, cs)
	begin
		if (cs='1') then
			bus_data<=dato;
		else
			bus_data<= (others=>'Z');
		end if;
	end process pbuf;
end arqrom;