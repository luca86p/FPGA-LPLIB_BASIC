-- =============================================================================
-- Whatis        : combinational decoder 2 to 4 bits
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoder2to4.vhd
-- Language      : VHDL-93
-- Module        : decoder2to4
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
--   1   0010
--   2   0100
--   3   1000
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


entity decoder2to4 is
    port (
        a    : in  std_logic_vector(1 downto 0);
        en   : in  std_logic;
        z    : out std_logic_vector(3 downto 0)
    );
end decoder2to4;


architecture rtl of decoder2to4 is

begin

    z(0) <= en when a="00" else '0';
    z(1) <= en when a="01" else '0';
    z(2) <= en when a="10" else '0';
    z(3) <= en when a="11" else '0';

end rtl;
