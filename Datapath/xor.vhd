library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity xor_block is
  port (xor_a, xor_b : in std_logic_vector(15 downto 0) ;
         dout	: out std_logic_vector(15 downto 0)
			--xor_flag: out std_logic
			) ;
end entity xor_block ;

architecture Struct of xor_block is
--for LHI command
--signal o1, c1, c2: std_logic; 
begin 
  dout <= xor_a xor xor_b ;
--dout(15 downto 9) <= "0000000";

end Struct;