-- =============================================================================
-- Whatis        : combinational decoder 3 to 8 bits
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoder3to8.vhd
-- Language      : VHDL-93
-- Module        : decoder3to8
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
--   1   00000010
--   2   00000100
--   3   00001000
--   4   00010000
--   5   00100000
--   6   01000000
--   7   10000000
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


entity decoder3to8 is
    port (
        a    : in  std_logic_vector(2 downto 0);
        en   : in  std_logic;
        z    : out std_logic_vector(7 downto 0)
    );
end decoder3to8;


architecture rtl of decoder3to8 is

begin

    z(0) <= en when a="000" else '0';
    z(1) <= en when a="001" else '0';
    z(2) <= en when a="010" else '0';
    z(3) <= en when a="011" else '0';
    z(4) <= en when a="100" else '0';
    z(5) <= en when a="101" else '0';
    z(6) <= en when a="110" else '0';
    z(7) <= en when a="111" else '0';

end rtl;
