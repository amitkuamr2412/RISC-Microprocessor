LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity memory IS
	generic
	(
		mem_a_width	: integer := 7;
		data_width	: integer := 16
	);
	
	port
	(
		clock				: in  std_logic;
		din			: in  std_logic_vector(data_width - 1 DOWNTO 0);
		mem_a			: in  std_logic_vector(mem_a_width - 1 DOWNTO 0);
		wr_en				: in  std_logic;
	--	rd_en				: in  std_logic;
		dout			: OUT std_logic_vector(data_width - 1 DOWNTO 0)
	);
end memory;

architecture struct of memory is
   type memory IS ARRAY(0 TO 127) OF std_logic_vector(data_width - 1 DOWNTO 0);
	signal memory_block : memory := (X"3355",X"106A",others=>( others => '0'));

begin
    dout <= memory_block(to_integer(unsigned(mem_a(mem_a_width - 1 downto 0))));			
	PROCESS (clock, wr_en, din)
	BEGin
		IF (clock'event AND clock = '1') THEN
			IF (wr_en = '1') THEN
			    memory_block(to_integer(unsigned(mem_a(mem_a_width - 1 downto 0)))) <= din;
			END IF;
		END IF;
	END PROCESS;

END struct;