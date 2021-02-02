-- =============================================================================
-- Whatis        : combinational 1-bit full-adder
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : fa.vhd
-- Language      : VHDL-93
-- Module        : fa
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


entity fa is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        cin  : in  std_logic ;
        s    : out std_logic ;
        cout : out std_logic
    );
end fa;


architecture rtl of fa is

begin

    s    <= a xor b xor cin ;
    cout <= (a and b) or ((a xor b) and cin);

end rtl;
