-- =============================================================================
-- Whatis        : combinational decoder for seven segment display
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : decoder_7seg.vhd
-- Language      : VHDL-93
-- Module        : decoder_7seg
-- Library       : lplib_basic
-- -----------------------------------------------------------------------------
-- Author(s)     : Luca Pilato <pilato[punto]lu[chiocciola]gmail[punto]com>
--                 
-- Company       : 
-- Addr          : 
-- -----------------------------------------------------------------------------
-- Description
--
--  The y output is the [a b c d e f g] concatenation.
--
--      a
--     ====
--  f | g  | b
--     ====
--  e |    | c
--     ====
--      d
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


entity decoder_7seg is
    port (
        x       : in  std_logic_vector(3 downto 0);
        y       : out std_logic_vector(6 downto 0)
    );
end decoder_7seg;


architecture rtl of decoder_7seg is

begin

    with x select y <=
        "1111110" when "0000", -- 0
        "0110000" when "0001", -- 1
        "1101101" when "0010", -- 2
        "1111001" when "0011", -- 3
        "0110011" when "0100", -- 4
        "1011011" when "0101", -- 5
        "1011111" when "0110", -- 6
        "1110000" when "0111", -- 7
        "1111111" when "1000", -- 8
        "1111011" when "1001", -- 9
        "1110111" when "1010", -- A
        "0011111" when "1011", -- b
        "1001110" when "1100", -- C
        "0111101" when "1101", -- d
        "1001111" when "1110", -- E
        "1000111" when "1111", -- F
        "0000000" when others;

end rtl;