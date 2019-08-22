library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux_8to1 is
Port ( x:in STD_LOGIC_VECTOR (7 downto 0);
sel:in STD_LOGIC_VECTOR (2 downto 0);
y : out STD_LOGIC);
end mux_8to1;
architecture Behavioral of mux_8to1 is
begin
process (x,sel)
begin
case sel is
when "000"=>y<=x(0);
when "001"=>y<=x(1);
when "010"=>y<=x(2);
when "011"=>y<=x(3);
when "100"=>y<=x(4);
when "101"=>y<=x(5);
when "110"=>y<=x(6);
when "111"=>y<=x(7);
when others=> null;
end case;
end process;
end Behavioral;