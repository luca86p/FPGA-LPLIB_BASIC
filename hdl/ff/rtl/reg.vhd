-- =============================================================================
-- Whatis        : N-bit register with enable
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : reg.vhd
-- Language      : VHDL-93
-- Module        : reg
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


entity reg is
    generic (
        RST_POL : std_logic := '0';    -- 0:active low   1:active high
        RST_VAL : std_logic := '0';    -- q value at rst
        N       : positive  := 8
    );
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        d       : in  std_logic_vector(N-1 downto 0);
        en      : in  std_logic;
        q       : out std_logic_vector(N-1 downto 0)
    );
end reg;


architecture rtl of reg is

    signal q_s : std_logic_vector(N-1 downto 0);

begin

    proc_reg: process(clk,rst)
    begin
        if rst=RST_POL then
            q_s <= (others=>RST_VAL);
        elsif rising_edge(clk) then
            if en='1' then
                q_s <= d;
            end if;
        end if;
    end process proc_reg;

    q <= q_s;

end rtl;
