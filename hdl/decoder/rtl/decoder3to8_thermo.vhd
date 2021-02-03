-- =============================================================================
-- Whatis        : combinational thermometric decoder 3 to 8 bits
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoder3to8_thermo.vhd
-- Language      : VHDL-93
-- Module        : decoder3to8_thermo
-- Library       : lplib_basic
-- -----------------------------------------------------------------------------
-- Author(s)     : Luca Pilato <pilato[punto]lu[chiocciola]gmail[punto]com>
--                 
-- Company       : 
-- Addr          : 
-- -----------------------------------------------------------------------------
-- Description
--
--  The enable is priority. If en=0 the output is x"00". Else:
--
--   a |    z
--   --------
--   0   00000001
--   1   00000011
--   2   00000111
--   3   00001111
--   4   00011111
--   5   00111111
--   6   01111111
--   7   11111111
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


entity decoder3to8_thermo is
    port (
        a    : in  std_logic_vector(2 downto 0);
        en   : in  std_logic;
        z    : out std_logic_vector(7 downto 0)
    );
end decoder3to8_thermo;


architecture rtl of decoder3to8_thermo is

begin

    z <= x"00" when en='0'    else
         x"01" when  a="000"  else
         x"03" when  a="001"  else
         x"07" when  a="010"  else
         x"0F" when  a="011"  else
         x"1F" when  a="100"  else
         x"3F" when  a="101"  else
         x"7F" when  a="110"  else
         x"FF" when  a="111"  ;

end rtl;
