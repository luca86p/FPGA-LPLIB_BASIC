-- =============================================================================
-- Whatis        : unsigned combinational 1-bit comparator
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : comp1.vhd
-- Language      : VHDL-93
-- Module        : comp1
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


entity comp1 is
    port (
        a    : in  std_logic;
        b    : in  std_logic;
        lt   : out std_logic;
        eq   : out std_logic;
        gt   : out std_logic
    );
end comp1;


architecture rtl of comp1 is

begin

    -- a < b
    lt  <= not(a) and b;

    -- a = b
    eq  <= a xnor b;

    -- a > b
    gt  <= a and not(b);

end rtl;
