-- =============================================================================
-- Whatis        : combinational 1-bit full-subtractor
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : fs.vhd
-- Language      : VHDL-93
-- Module        : fs
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


entity fs is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        bin  : in  std_logic ;
        s    : out std_logic ;
        bout : out std_logic
    );
end fs;


architecture rtl of fs is

begin

    s    <= a xor b xor bin ;
    bout <= ((not a) and b) or ((a xnor b) and bin);

end rtl;
