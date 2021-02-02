-- =============================================================================
-- Whatis        : combinational 1-bit half-subtractor
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : hs.vhd
-- Language      : VHDL-93
-- Module        : hs
-- Library       : lplib_basic
-- -----------------------------------------------------------------------------
-- Author(s)     : Luca Pilato <pilato[punto]lu[chiocciola]gmail[punto]com>
--                 
-- Company       : 
-- Addr          : 
-- -----------------------------------------------------------------------------
-- Description
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


entity hs is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        s    : out std_logic ;
        bout : out std_logic
    );
end hs;


architecture rtl of hs is

begin

    s    <= a xor b ;
    bout <= (not a) and b ;

end rtl;
