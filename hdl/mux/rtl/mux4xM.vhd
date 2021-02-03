-- =============================================================================
-- Whatis        :
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : mux4xM.vhd
-- Language      : VHDL-93
-- Module        : mux4xM
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


entity mux4xM is
    generic (
        M : positive := 8
    );
    port (
        a    : in  std_logic_vector(M-1 downto 0);
        b    : in  std_logic_vector(M-1 downto 0);
        c    : in  std_logic_vector(M-1 downto 0);
        d    : in  std_logic_vector(M-1 downto 0);
        sel  : in  std_logic_vector(  1 downto 0);
        z    : out std_logic_vector(M-1 downto 0)
    );
end mux4xM;


architecture rtl of mux4xM is

begin

    z <= a when sel="00" else
         b when sel="01" else
         c when sel="10" else
         d ;

end rtl;
