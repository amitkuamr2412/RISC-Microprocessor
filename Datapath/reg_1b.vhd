LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity reg_1b is  
  port(clock,reset,en : in std_logic;
       din   		 : in std_logic;  
       dout  	    : out std_logic
      );  
end reg_1b;

architecture struct of reg_1b is  
  begin  
	
    process (clock,reset,en )  
      begin  
		if(reset = '1') then
			dout <= '0';
      elsif( (rising_edge(clock)) and en = '1')  then  
          dout <= din;  
      end if;  
    end process;  
end struct;