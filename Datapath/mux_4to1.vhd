library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_4to1 is
 port(
 
     x0,x1,x2,x3:in STD_LOGIC_VECTOR (15 downto 0);
     sel:in STD_LOGIC_VECTOR (1 downto 0);
     y : out STD_LOGIC_VECTOR (15 downto 0)
     );
end mux_4to1;
 
architecture Behavioral of mux_4to1 is
begin
process (x0,x1,x2,x3,sel)
begin
case sel is
when "00"=>y<=x0;
when "01"=>y<=x1;
when "10"=>y<=x2;
when "11"=>y<=x3;
when others=> null;
end case;
end process;
end Behavioral;