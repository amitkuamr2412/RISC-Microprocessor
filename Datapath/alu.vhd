library IEEE;
use IEEE.STD_LOGIC_1164.all;      
use ieee.numeric_std.all;
-- ALU 
-- INPUTS: alu_a, alu_b, op_code
-- OUTPUTS: C-out,Z_out,alu_out

entity ALU is
     port(
         alu_a : in STD_LOGIC_VECTOR(15 downto 0);
			alu_b : in STD_LOGIC_VECTOR(15 downto 0);
			op_code : in STD_LOGIC;
			alu_out : out STD_LOGIC_VECTOR(15 downto 0);
			z_out : out STD_LOGIC;
			c_out : out STD_LOGIC);
end ALU;

architecture ALU_arch of ALU is

signal c: STD_LOGIC_VECTOR(16 downto 0);
     
begin

alu_prc : process (alu_a,alu_b,op_code,c) is
    begin
        if (op_code='0') then
		  c <= std_logic_vector(resize(unsigned(alu_a),17) + resize(unsigned(alu_b),17));
		  array_1: for i in 0 to 15 loop
		 -- alu_out(i)<=c(i);
		  end loop array_1;
		  c_out<=c(16);
		  z_out<= not( c(0) or c(1) or c(2) or c(3) or c(4) or c(5) or c(6) or c(7) or c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15));

		  else
		  array_2: for j in 0 to 15 loop
		  c(16)<='0';
		  c(j)<= ( alu_a(j) nand alu_b(j) );
		  --alu_out(j)<= ( alu_a(j) nand alu_b(j) );
		  end loop array_2;
		  z_out<= not( c(0) or c(1) or c(2) or c(3) or c(4) or c(5) or c(6) or c(7) or c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15));
		  c_out<='0';
		  
        end if;
    end process alu_prc;
	 alu_out <= c(15 downto 0) ;
    
end ALU_arch;
