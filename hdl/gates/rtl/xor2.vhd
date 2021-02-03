-- =============================================================================
-- Whatis        :
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : xor2.vhd
-- Language      : VHDL-93
-- Module        : xor2
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


entity xor2 is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        z    : out std_logic
    );
end xor2;


architecture rtl of xor2 is

begin

    z <= a xor b;

end rtl;
