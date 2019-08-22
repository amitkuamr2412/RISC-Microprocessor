library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity SE9 is
  port (ir_8_0 : in std_logic_vector(8 downto 0) ;
         dout	: out std_logic_vector(15 downto 0) 
			) ;
end entity SE9 ;

architecture Struct of SE9 is
--for LHI command
--signal o1, c1, c2: std_logic; 
begin 
  dout(8 downto 0) <= ir_8_0 ;
dout(15 downto 9) <= "0000000";

end Struct;