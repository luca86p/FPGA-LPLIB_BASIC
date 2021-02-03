-- =============================================================================
-- Whatis        : 
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : dlatch.vhd
-- Language      : VHDL-93
-- Module        : dlatch
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


entity dlatch is
    port (
        d   : in  std_logic;
        en  : in  std_logic;
        q   : out std_logic
    );
end dlatch;


architecture rtl of dlatch is

begin

    q <= d when en='1';

end rtl;
