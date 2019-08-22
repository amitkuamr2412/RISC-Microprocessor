library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity SE6 is
  port (ir_5_0 : in std_logic_vector(5 downto 0) ;
         dout	: out std_logic_vector(15 downto 0) 
			) ;
end entity SE6 ;

architecture Struct of SE6 is
--for LHI command
--signal o1, c1, c2: std_logic; 
begin 
  dout(5 downto 0) <= ir_5_0 ;
  dout(15 downto 6) <= "0000000000";
 --   dout <= std_logic_vector(resize(unsigned(ir_5_0), dout'length));
end Struct;