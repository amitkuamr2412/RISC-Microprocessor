library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Reg_file is   
    port
    (
	 rf_a1   	      : in  std_logic_vector(2 downto 0);
    rf_a2	         : in  std_logic_vector(2 downto 0);
    rf_a3   	      : in  std_logic_vector(2 downto 0);
    rf_d1          	: out std_logic_vector(15 downto 0);
    rf_d2          	: out std_logic_vector(15 downto 0);
    rf_d3          	: in  std_logic_vector(15 downto 0);
    Wr_en            : in  std_logic;
 -- rd_en1		      : in  std_logic;
  --rd_en2           : in  std_logic;
    clk,reset        : in  std_logic
    );
end Reg_file;

architecture behavioral of Reg_file is
type R is array(0 to 7) of std_logic_vector(15 downto 0); --Eight 16-bit registers R(0) to R(7)
signal registers : R := (others => (others => '0') ) ;

begin

    regFile: process(clk,reset,Wr_en)
    begin
			
			if (reset = '1') then
			registers <= (others => (others => '0') ) ;
			elsif rising_edge(clk) and (Wr_en = '1') then 
					registers(to_integer(unsigned(rf_a3))) <= rf_d3;
			end if ;

    end process;
--	if ( rd_en1 = '1' ) then
	rf_d1 <= registers(to_integer(unsigned(rf_a1))); 
	--end if ;
--	if ( rd_en2 = '1' ) then
	rf_d2 <= registers(to_integer(unsigned(rf_a2)));
--   end if ;	

	end behavioral;