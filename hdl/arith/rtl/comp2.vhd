-- =============================================================================
-- Whatis        : unsigned combinational 2-bit comparator
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : comp2.vhd
-- Language      : VHDL-93
-- Module        : comp2
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


entity comp2 is
    port (
        a    : in  std_logic_vector(1 downto 0);
        b    : in  std_logic_vector(1 downto 0);
        lt   : out std_logic;
        eq   : out std_logic;
        gt   : out std_logic
    );
end comp2;


architecture rtl of comp2 is

begin

    -- a < b
    lt  <= ( (not a(0)) and (not a(1)) and b(0) ) or
           ( (not a(1)) and b(1)                ) or
           ( (not a(0)) and b(1) and b(0)       );

    -- a = b
    eq  <= (a(1) xnor b(1)) and (a(0) xnor b(0));

    -- a > b
    gt  <= ( (not b(0)) and (not b(1)) and a(0) ) or
           ( (not b(1)) and a(1)                ) or
           ( (not b(0)) and a(1) and a(0)       );

end rtl;
