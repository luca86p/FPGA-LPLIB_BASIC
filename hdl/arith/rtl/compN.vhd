-- =============================================================================
-- Whatis        : unsigned combinational N-bit comparator
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : compN.vhd
-- Language      : VHDL-93
-- Module        : compN
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
use ieee.numeric_std.all;


entity compN is
    generic (
        N    : positive := 8
    );
    port (
        a    : in  std_logic_vector(N-1 downto 0);
        b    : in  std_logic_vector(N-1 downto 0);
        lt   : out std_logic;
        eq   : out std_logic;
        gt   : out std_logic
    );
end compN;


architecture rtl of compN is

begin

    -- a < b
    lt  <= '1' when unsigned(a) < unsigned(b) else '0';

    -- a = b
    eq  <= '1' when a=b else '0';

    -- a > b
    gt  <= '1' when unsigned(a) > unsigned(b) else '0';

end rtl;
