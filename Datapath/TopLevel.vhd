----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

-----------------------------------------------
entity TopLevel is 
	port( clock,reset: in std_logic);
end entity;
------------------------------
architecture struct of TopLevel is

signal cout,zout : std_logic ;
signal xout,irout : std_logic_vector(15 downto 0) ;

signal sir_en ,sbit_en,sxor_a_co, sxor_b_co1, sxor_b_co2,srf_a1_co, sdin_co,spc_en, 
spc_co,smem_a_co, swr_en,salu_a1,salu_a2,salu_b1,salu_b2 , salu_code,srfd3_co1,srfd3_co2,srfa3_co1,srfa3_co2, srf_wren,
st1_en,sc_en,sz_en,
st2_en,st3_en,st4_en,st5_en,st2_co,st4_co1,st4_co2 ,st3_co1,st3_co2 : std_logic;

component Datapath is 
	port( ir_en ,bit_en,xor_a_co, xor_b_co1, xor_b_co2,rf_a1_co, din_co, --7
	pc_en, pc_co, --2
	mem_a_co, wr_en, --2
	alu_a1,alu_a2,alu_b1,alu_b2 , alu_code, --5
	rfd3_co1,rfd3_co2, rfa3_co1,rfa3_co2, rf_wren, --4
	t1_en,c_en,z_en,t2_en,t3_en,t4_en,t5_en,t2_co,t4_co1,t4_co2,t3_co1,t3_co2,clock,reset: in std_logic; --9
	c_out,z_out: out std_logic;
	ir_data, xor_out_final: out std_logic_vector(15 downto 0)
	);
end component Datapath;

component fsm is port (
      clock, reset: in std_logic;
		
      c_out,z_out: in std_logic;
		
		ir_data, xor_out_final: in std_logic_vector(15 downto 0);
		ir_en ,bit_en,xor_a_co, xor_b_co1, xor_b_co2,rf_a1_co, din_co, 
	   pc_en, pc_co,                                                  
	   mem_a_co, wr_en,                                          
	   alu_a1,alu_a2,alu_b1,alu_b2 , alu_code,                               
	   rfd3_co1,rfd3_co2,rfa3_co1,rfa3_co2, rf_wren,                                 
	   t1_en,c_en,z_en,t2_en,t3_en,t4_en,t5_en,t2_co,t4_co1,t4_co2 ,t3_co1,t3_co2: out std_logic
		);
end component fsm;

begin
Datapat : Datapath port map(sir_en ,sbit_en,sxor_a_co, sxor_b_co1, sxor_b_co2,srf_a1_co, sdin_co,
spc_en, spc_co, smem_a_co, swr_en,
salu_a1,salu_a2,salu_b1,salu_b2 , salu_code,srfd3_co1,srfd3_co2,srfa3_co1,srfa3_co2, srf_wren,
st1_en,sc_en,sz_en,
st2_en,st3_en,st4_en,st5_en,st2_co,st4_co1,st4_co2 ,st3_co1,st3_co2 ,
clock,reset,
cout,zout,
irout,xout) ;

FSM_control: fsm port map (clock,reset,
cout,zout,
irout,xout,
sir_en ,sbit_en,sxor_a_co, sxor_b_co1, sxor_b_co2,srf_a1_co,
 sdin_co,spc_en, spc_co,smem_a_co, swr_en,
 salu_a1,salu_a2,salu_b1,salu_b2 , salu_code,
 srfd3_co1,srfd3_co2,srfa3_co1,srfa3_co2, srf_wren,
st1_en,sc_en,sz_en,
st2_en,st3_en,st4_en,st5_en,st2_co,st4_co1,st4_co2 ,st3_co1,st3_co2) ;

end struct;
