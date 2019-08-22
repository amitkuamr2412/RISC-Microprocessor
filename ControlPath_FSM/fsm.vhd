----------------Top level entity of the logic---------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fsm is port (
      clock, reset: in std_logic;
		
      c_out,z_out: in std_logic;
		
		ir_data, xor_out_final: in std_logic_vector(15 downto 0);
		ir_en ,bit_en,xor_a_co, xor_b_co1, xor_b_co2,rf_a1_co, din_co, --7
	   pc_en, pc_co,                                                         --2
	   mem_a_co, wr_en,                                                       --2
	   alu_a1,alu_a2,alu_b1,alu_b2 , alu_code,                                --5
	   rfd3_co1,rfd3_co2, rfa3_co1,rfa3_co2, rf_wren,                                   --4
	   t1_en,c_en,z_en,t2_en,t2_co,t3_en,t4_en,t5_en,t4_co1,t4_co2 ,t3_co: out std_logic
		);
end fsm;


architecture a1 of fsm is

type state_type is (s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15, s16, s17, s18, s19, s20);
signal state, next_state : state_type; 
begin
SYNC_PROC : process (clock,reset)
begin
	 if rising_edge(clock) then
		 if (reset = '1') then
			state <= s1;
		 else
			state <= next_state;
		 end if;
	end if;
end process;
----------================================================================================
OUTPUT_DECODE :
process (state)
begin
--------------------Initialising in Start------------------------------------------------------
	ir_en<='0';
	bit_en<='0';
	xor_a_co<='0';
	xor_b_co1<='0';
	xor_b_co2<='0';
	
	rf_a1_co<='0';
	din_co<='0';
	pc_en<='0';
	pc_co<='0';
	mem_a_co<='0';
	
	wr_en<='0';
	alu_a1<='0';
	alu_a2<='0';
	alu_b1<='0';
	alu_b2<='0'; 
	
	alu_code<='0';
	rfd3_co1<='0'; 
	rfd3_co2<='0'; 	
	rfa3_co1<='0';
	rfa3_co2<='0';	
	rf_wren<='0'; 
	
	t1_en<='0';
	c_en<='0';
	z_en<='0';
	t2_en<='0';
	t3_en<='0';
	t2_co <= '0' ;
	t4_en<='0';
	t5_en<='0';
	t3_co<='0';
	t4_co1<='0';
	t4_co2<='0';
-----------------------------------------------------------------------

  case (state) is
   when s1 => 
      alu_code<='0';
      bit_en<='1';
      alu_a1<='1';
      alu_a2<='0';
      pc_en<='1';
      pc_co<='0';
      wr_en<='0';
      mem_a_co<='0';
      ir_en<='1';
	 
 
   when s2 =>
      t1_en<='1';
      t2_en<='1';


   when s3 =>
     alu_code<='0';
     alu_b1<='1'; 
     alu_b2<='1';
     alu_a1<='0';
     alu_a2<='1';
     c_en<='1';
     z_en<='1';
     t3_co<='0';

   when s4=>
     rfa3_co1<='0';
	  rfa3_co2<='0';
     rfd3_co1<='0';	  
     rfd3_co2<='0';


     
   when s5=>
      alu_code<='1';
      alu_b1<='1'; 
      alu_b2<='1';
      alu_a1<='0';
      alu_a2<='1';
      c_en<='0';
      z_en<='1';
      t3_co<='0';

   when s6=>
      alu_code<='0';
      bit_en<='0';
      alu_b1<='1'; 
      alu_b2<='1';
      alu_a1<='0';
      alu_a2<='0';
      c_en<='1';
      z_en<='1'; 
      t3_co<='0';

  when s7=>
       rfa3_co2<='1';
       rfa3_co1<='0';
       rfd3_co1<='0';
		 rfd3_co2<='0';
		 

   when s8=>
      wr_en<='0';
      t3_co<='1';
      mem_a_co<='1';
 
   when s9=>
      wr_en<='1';
      mem_a_co<='1';
       
    when s10=>
      rfa3_co2<='1';
      rfa3_co1<='0';
      rfd3_co2<='1';
   	rfd3_co1<='0';

 
    when s11=>
      xor_a_co<='0';
      xor_b_co1<='0';
      xor_b_co2<='0';

    when s12=>
      alu_code<='0';
      bit_en<='0';
      alu_b1<='1';
      alu_b2<='0';
      alu_a1<='0';
      alu_a2<='1';
      pc_en<='1';
      pc_co<='0';
		rfd3_co1<='0' ;
		rfd3_co2<='1' ;

    when s13=>
      rfa3_co2<='1';
	   rfa3_co1<='0';
      rfd3_co2<='1';
		rfd3_co1<='0';
      mem_a_co<='0';
      ir_en<='1';


     when s14=>
      alu_code<='0';
      bit_en<='0';
      alu_b1<='0';
      alu_b2<='1';
      alu_a1<='1';
      alu_a2<='0';
      pc_en<='1';
      pc_co<='0';

    when s15=>
      alu_a1<='1';
      alu_a2<='0';
      rfa3_co2<='1';
		rfa3_co1<='0';
      rf_wren<='1';
      rfd3_co2<='0';
      t3_en<='0';
      t3_co<='1';
      mem_a_co<='0';

     when s16=>
       pc_en<='1';
       pc_co<='1';
       rfa3_co2<='1';
       rfd3_co1<='0';
       t3_en<='0';
       t3_co<='1';
       mem_a_co<='0';
   
     when s17=>
       xor_a_co<='1';
      xor_b_co1<='1';
      xor_b_co2<='0';
       bit_en<='1';
       alu_a1<='1';
       alu_a2<='1';
       t3_en<='1';
       t3_co<='0';
       mem_a_co<='1';
       din_co<='0';
       t4_co1<='1';
       t4_co2<='1';
        
    when s18=>
         xor_a_co<='1';
         t4_en<='1';
         xor_b_co1<='0';
         xor_b_co2<='1';
         wr_en<='1';
         din_co<='1';
         rf_a1_co<='1';


    when s19=>
          xor_a_co<='1';
         t4_en<='1';
         xor_b_co1<='0';
         xor_b_co2<='1';
         t3_en<='1';
          wr_en<='1';
          din_co<='1';
         rf_a1_co<='1';
          t2_co<='1';
		

   when s20=>
         xor_a_co<='1';
         t4_en<='1';
         xor_b_co1<='0';
         xor_b_co2<='1';
         rfd3_co1<='1';
			rfd3_co2<='0';
   -- when others =>
 
  
   end case; 
	end process;

--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


NEXT_STATE_DECODE : process (state, c_out, z_out,ir_data, xor_out_final)
	begin
	 next_state <= s1;
	 case (state) is
	 when s1 =>
		 next_state<=s2;
			if (ir_data(15 downto 12)="0000" and ir_data(1 downto 0)="10" and c_out='0') then
				next_state<=s1;
			elsif (ir_data(15 downto 12)="0000" and ir_data(1 downto 0)="01" and z_out='0') then
				next_state<=s1;
			elsif (ir_data(15 downto 12)="0001" and ir_data(1 downto 0)="01" and z_out='0') then 
				next_state<=s1;
			elsif (ir_data(15 downto 12)="0000" and ir_data(1 downto 0)="10" and c_out='0') then
				next_state<=s1;
			end if;

	when s2 =>
		 if (ir_data(15 downto 12)="0000") then --ADD/ADC/ADZ
			next_state<=s3;
		 end if;
		 if (ir_data(15 downto 12)="0010") then --NDU/NDZ/NDC
			next_state<=s5;
		 end if;
		 if (ir_data(15 downto 12)="0001") then --ADI
			next_state<=s6;
		 end if;
		 if (ir_data(15 downto 12)="0100") then --LW
			next_state<=s8;
		 end if;
		 if (ir_data(15 downto 12)="0101") then --SW
			next_state<=s10;
		 end if;
		 if (ir_data(15 downto 12)="0011") then --LHI
			next_state<=s12;
		 end if;
		 if (ir_data(15 downto 12)="1100") then --BEQ
			next_state<=s13;
		 end if;
		 if (ir_data(15 downto 12)="1000") then --JAL
			next_state<=s15;
		 end if;
		 if (ir_data(15 downto 12)="1001") then --JLR
			next_state<=s16;
		 end if;
		 if (ir_data(15 downto 12)="0110") then ---LM
			next_state<=s17;
		 end if;
		 if (ir_data(15 downto 12)="0111") then --SM
			next_state<=s19;
		 end if;
		 
	when s3 =>
		next_state<=s4;
		
	when s4 =>
		next_state<=s1;
	when s5 =>
		next_state<=s4;
	when s6 =>
		next_state<=s7;
	when s7 =>
		next_state<=s1;
	when s8 =>
		next_state<=s9;
	when s9 =>
		next_state<=s7;
	when s10 =>
		next_state<=s11;
	when s11 =>
		next_state<=s1;
	when s12 =>
		next_state <= s1;
	when s13 =>
		if(xor_out_final="0000000000000000") then
			next_state<=s14;
		else
			next_state<=s1;
		end if;
	when s14 =>
		next_state<=s1;
	when s15 =>
		next_state<= s1;
	when s16=>
		next_state<= s1;
	when s17 =>
		if(xor_out_final="0000000000000000") then
			next_state<=s18;
		else
			next_state<=s1;
		end if;
	when s18 =>
		next_state <= s17;
	when s19 =>
		if(xor_out_final="0000000000000000") then 
			next_state<=s20;
		else
			next_state<=s1;
		end if;
	when s20 =>
		next_state<= s19;
	when others =>
		next_state <= s1;
	 end case;
end process;
end a1;
