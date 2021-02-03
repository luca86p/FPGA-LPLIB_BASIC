-- =============================================================================
-- Whatis        : SR flip-flop
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : ffsr.vhd
-- Language      : VHDL-93
-- Module        : ffsr
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


entity ffsr is
    generic (
        RST_POL : std_logic := '0';    -- 0:active low   1:active high
        RST_VAL : std_logic := '0'     -- q value at rst
    );
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        s       : in  std_logic;
        r       : in  std_logic;
        q       : out std_logic
    );
end ffsr;

architecture rtl of ffsr is

    signal q_s : std_logic;

begin

    proc_ff: process(clk,rst)
    begin
        if rst=RST_POL then
            q_s <= RST_VAL;
        elsif rising_edge(clk) then
            if s='1' then
                q_s <= '1';
            elsif r='1' then
                q_s <= '0';
            end if;
        end if;
    end process proc_ff;

    q <= q_s;

end rtl;
