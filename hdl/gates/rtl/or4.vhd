-- =============================================================================
-- Whatis        :
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : or4.vhd
-- Language      : VHDL-93
-- Module        : or4
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


entity or4 is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        c    : in  std_logic ;
        d    : in  std_logic ;
        z    : out std_logic
    );
end or4;


architecture rtl of or4 is

begin

    z <= a or b or c or d;

end rtl;
