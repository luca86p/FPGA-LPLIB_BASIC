-- =============================================================================
-- Whatis        : combinational thermometric decoder N to M=2**N bits
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoderNtoM_thermo.vhd
-- Language      : VHDL-93
-- Module        : decoderNtoM_thermo
-- Library       : lplib_basic
-- -----------------------------------------------------------------------------
-- Author(s)     : Luca Pilato <pilato[punto]lu[chiocciola]gmail[punto]com>
--                 
-- Company       : 
-- Addr          : 
-- -----------------------------------------------------------------------------
-- Description
--
--  The enable is priority. If en=0 the output is 0.
--  N is constrained in range 2 to 8.
--
-- -----------------------------------------------------------------------------
-- Dependencies
-- 
-- -----------------------------------------------------------------------------
-- Issues
-- 
-- -----------------------------------------------------------------------------
-- Copyright (c) 2021 Luca Pilato
-- MIT License
-- -----------------------------------------------------------------------------
-- date        who               changes
-- 2021-02-02  Luca Pilato       file creation
-- =============================================================================


-- IEEE libraries
-- --------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity decoderNtoM_thermo is
    generic (
        N    : integer range 2 to 8 := 2
    );
    port (
        a    : in  std_logic_vector(N-1 downto 0);
        en   : in  std_logic;
        z    : out std_logic_vector(2**N-1 downto 0)
    );
end decoderNtoM_thermo;


architecture rtl of decoderNtoM_thermo is

begin

    proc_NtoM: process(a,en)
    begin
        if en='1' then
	          for i in 0 to 2**N-1 loop
	              if i>unsigned(a) then
		                z(i) <= '0';
		            else
		                z(i) <= '1';
		            end if;
	          end loop;
	      else
	          z <= (others=>'0');
	      end if;
    end process proc_NtoM;


end rtl;
