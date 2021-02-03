-- =============================================================================
-- Whatis        : JK flip-flop
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : ffjk.vhd
-- Language      : VHDL-93
-- Module        : ffjk
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


entity ffjk is
    generic (
        RST_POL : std_logic := '0';    -- 0:active low   1:active high
        RST_VAL : std_logic := '0'     -- q value at rst
    );
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        j       : in  std_logic;
        k       : in  std_logic;
        q       : out std_logic
    );
end ffjk;


architecture rtl of ffjk is

    signal q_s : std_logic;

begin

    proc_ff: process(clk,rst)
    begin
        if rst=RST_POL then
            q_s <= RST_VAL;
        elsif rising_edge(clk) then
            if j='1' and k='1' then
                q_s <= not q_s;
            elsif j='1' then
                q_s <= '1';
            elsif k='1' then
                q_s <= '0';
            end if;
        end if;
    end process proc_ff;

    q <= q_s;

end rtl;
