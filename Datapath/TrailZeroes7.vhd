library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity TrailZeroes7 is
  port (ir_8_0 : in std_logic_vector(8 downto 0) ;
         tz7 : out std_logic_vector(15 downto 0) 
			) ;
end entity TrailZeroes7 ;

architecture Struct of TrailZeroes7 is
--for LHI command
--signal o1, c1, c2: std_logic; 
begin 
  tz7(15 downto 7) <= ir_8_0 ;
  tz7(6 downto 0) <= "0000000";
end Struct;