LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity ir is  
  port(clock,reset,en : in std_logic;
       din   		 : in std_logic_vector(15 downto 0);  
       dout  	    : out std_logic_vector(15 downto 0)
      );  
end ir;

architecture struct of ir is  
  begin  
	
    process (clock,reset,en )  
      begin  
		if(reset = '1') then
			dout <= (others => '0');
      elsif ( (rising_edge(clock)) and en = '1') then  
          dout <= din;  
      end if;  
    end process;  
end struct;
