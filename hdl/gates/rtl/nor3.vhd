-- =============================================================================
-- Whatis        :
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : nor3.vhd
-- Language      : VHDL-93
-- Module        : nor3
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


entity nor3 is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        c    : in  std_logic ;
        z    : out std_logic
    );
end nor3;


architecture rtl of nor3 is

begin

    z <= not (a or b or c);

end rtl;
