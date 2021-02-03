-- =============================================================================
-- Whatis        :
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : mux4x1.vhd
-- Language      : VHDL-93
-- Module        : mux4x1
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


entity mux4x1 is
    port (
        a    : in  std_logic ;
        b    : in  std_logic ;
        c    : in  std_logic ;
        d    : in  std_logic ;
        sel  : in  std_logic_vector(1 downto 0) ;
        z    : out std_logic
    );
end mux4x1;


architecture rtl of mux4x1 is

begin

    z <= a when sel="00" else
         b when sel="01" else
         c when sel="10" else
         d ;

end rtl;
