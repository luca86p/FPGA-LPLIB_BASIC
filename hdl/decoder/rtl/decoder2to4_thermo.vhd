-- =============================================================================
-- Whatis        : combinational thermometric decoder 2 to 4 bits
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoder2to4_thermo.vhd
-- Language      : VHDL-93
-- Module        : decoder2to4_thermo
-- Library       : lplib_basic
-- -----------------------------------------------------------------------------
-- Author(s)     : Luca Pilato <pilato[punto]lu[chiocciola]gmail[punto]com>
--                 
-- Company       : 
-- Addr          : 
-- -----------------------------------------------------------------------------
-- Description
--
--  The enable is priority. If en=0 the output is "0000". Else:
--
--   a |    z
--   --------
--   0   0001
--   1   0011
--   2   0111
--   3   1111
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


entity decoder2to4_thermo is
    port (
        a    : in  std_logic_vector(1 downto 0);
        en   : in  std_logic;
        z    : out std_logic_vector(3 downto 0)
    );
end decoder2to4_thermo;


architecture rtl of decoder2to4_thermo is

begin

    z   <=  "0000" when en='0'  else
            "0001" when a="00"  else
            "0011" when a="01"  else
            "0111" when a="10"  else
            "1111" when a="11"  ;

end rtl;
