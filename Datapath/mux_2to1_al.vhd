library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_4to1_3bit is
 port(
 
     x0,x1, x2, x3:in STD_LOGIC_vector(2 downto 0);
     sel:in STD_LOGIC_vector(1 downto 0);
     y : out STD_LOGIC_vector(2 downto 0)
  );
end mux_4to1_3bit;
 
architecture Behavioral of mux_4to1_3bit is
--signal y :  STD_LOGIC_vector(2 downto 0) ;
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

--y_out <= y ;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux_2to1_3bit is
 port(
 
     x0,x1:in STD_LOGIC_vector(2 downto 0);
     sel:in STD_LOGIC;
     y : out STD_LOGIC_vector(2 downto 0)
  );
end mux_2to1_3bit;
 
architecture Behavioral of mux_2to1_3bit is
--signal y :  STD_LOGIC_vector(2 downto 0) ;
begin
process (x0,x1,sel)
begin
case sel is
when '0'=>y<=x0;
when '1'=>y<=x1;

when others=> null;
end case;
end process;

--y_out <= y ;

end Behavioral;