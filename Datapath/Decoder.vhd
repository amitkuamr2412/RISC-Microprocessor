library IEEE;
use IEEE.STD_LOGIC_1164.all;      
use ieee.numeric_std.all;
--  Decoder
entity Decoder is
     port(
         din : in STD_LOGIC_VECTOR(2 downto 0);
         dout : out STD_LOGIC_VECTOR(15 downto 0)
         );
end Decoder;
architecture decoder_arch of Decoder is
begin

decoder_prc: process (din) is
    begin
        if (din(2)='1' and din(1)='1' and din(0)='1') then
            dout <= "0000000010000000";
			elsif (din(2)='1' and din(1)='1' and din(0)='0') then
            dout <= "0000000001000000";
			elsif (din(2)='1' and din(1)='0' and din(0)='1') then
            dout <= "0000000000100000";
			elsif (din(2)='1' and din(1)='0' and din(0)='0') then
            dout <= "0000000000010000";
			elsif (din(2)='0' and din(1)='1' and din(0)='1') then
            dout <= "0000000000001000";
			elsif (din(2)='0' and din(1)='1' and din(0)='0') then
            dout <= "0000000000000100";
			elsif (din(2)='0' and din(1)='0' and din(0)='1') then
            dout <= "0000000000000010";
			elsif (din(2)='0' and din(1)='0' and din(0)='0') then
            dout <= "0000000000000001";
			else dout <= "0000000010000000";
        end if;
    end process decoder_prc;
    
end decoder_arch;