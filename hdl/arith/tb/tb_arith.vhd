-- =============================================================================
-- Whatis        : testbench
-- Project       : 
-- -----------------------------------------------------------------------------
-- File          : tb_arith.vhd
-- Language      : VHDL-93
-- Module        : tb
-- Library       : lplib_basic_verif
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
-- 2021-02-03  Luca Pilato       file creation
-- =============================================================================


-- STD lib
-- ----------------------------------------
use std.textio.all;

-- IEEE lib
-- ----------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_textio.all;

-- User lib
-- ----------------------------------------
library lplib_basic;


entity tb is
end entity tb;


architecture beh of tb is

    -- TB common parameters and signals
    -- ----------------------------------------
    constant RST_POL    : std_logic := '0';
    constant CLK_FREQ   : positive  := 10000000; -- 10 MHz (100 ns)
    --
    constant TCLK       : time  := 1.0e10/real(CLK_FREQ) * (0.1 ns); -- clock period
    constant DUTYCLK    : real  := 0.5; -- clock duty-cycle

    signal en_clk       : std_logic;
    --
    signal clk          : std_logic := '0';
    signal rst          : std_logic := RST_POL;
    --
    signal tcase        : integer   := 0;


    -- Check Process
    -- ----------------------------------------
    signal err_counter  : integer   := 0;


    -- Constant
    -- ----------------------------------------
    constant N          : positive  := 4;


    -- Signals 
    -- ----------------------------------------
    signal comp1_a      : std_logic;
    signal comp1_b      : std_logic;
    signal comp1_lt     : std_logic;
    signal comp1_eq     : std_logic;
    signal comp1_gt     : std_logic;
    --
    signal comp2_a      : std_logic_vector(1 downto 0);
    signal comp2_b      : std_logic_vector(1 downto 0);
    signal comp2_lt     : std_logic;
    signal comp2_eq     : std_logic;
    signal comp2_gt     : std_logic;
    --
    signal compN_a      : std_logic_vector(N-1 downto 0);
    signal compN_b      : std_logic_vector(N-1 downto 0);
    signal compN_lt     : std_logic;
    signal compN_eq     : std_logic;
    signal compN_gt     : std_logic;


begin

    -- clock generator 50%
    -- ----------------------------------------
    clk <= not clk after TCLK/2 when en_clk='1' else '0';


    -- clock generator DUTYCLK% 
    -- ----------------------------------------
    -- proc_clk: process(clk, en_clk)
    -- begin
    --     if en_clk='1' then
    --         if clk='0' then
    --             clk <= '1' after TCLK*(1.0-DUTYCLK);
    --         else
    --             clk <= '0' after TCLK*DUTYCLK;
    --         end if;
    --     else
    --         clk <= '0'
    --     end if;
    -- end process proc_clk;


    -- Unit(s) Under Test
    -- ----------------------------------------
    i_comp1: entity lplib_basic.comp1(rtl)
        port map (
            a       => comp1_a  ,
            b       => comp1_b  ,
            lt      => comp1_lt ,
            eq      => comp1_eq ,
            gt      => comp1_gt 
        );

    i_comp2: entity lplib_basic.comp2(rtl)
        port map (
            a       => comp2_a  ,
            b       => comp2_b  ,
            lt      => comp2_lt ,
            eq      => comp2_eq ,
            gt      => comp2_gt 
        );

    i_compN: entity lplib_basic.compN(rtl)
        generic map (
            N       => N
        )
        port map (
            a       => compN_a  ,
            b       => compN_b  ,
            lt      => compN_lt ,
            eq      => compN_eq ,
            gt      => compN_gt 
        );
  

    -- Drive Process
    -- ----------------------------------------    
    proc_drive: process
    begin
        -- ========
        tcase       <= 0;
        --
        en_clk      <= '0';
        rst         <= RST_POL;
        --
        comp1_a     <= '0';
        comp1_b     <= '0';
        --
        comp2_a     <= "00";
        comp2_b     <= "00";
        --
        compN_a     <= (others=>'0');
        compN_b     <= (others=>'0');
        --
        wait for 333 ns;
        en_clk     <= '1';
        wait for 333 ns;
        wait until falling_edge(clk);
        rst        <= not RST_POL;
        wait for 333 ns;
        wait until rising_edge(clk);
        --
        -- ========
        tcase   <= 1;
        wait until rising_edge(clk);
        --
        --
        comp1_a     <= '1';
        comp1_b     <= '0';
        --
        comp2_a     <= "10";
        comp2_b     <= "00";
        --
        compN_a     <= std_logic_vector(TO_UNSIGNED(2**N-1,N));
        compN_b     <= (others=>'0');
        --
        wait until rising_edge(clk);
        --
        comp1_a     <= '0';
        comp1_b     <= '1';
        --
        comp2_a     <= "00";
        comp2_b     <= "10";
        --
        compN_a     <= (others=>'0');
        compN_b     <= std_logic_vector(TO_UNSIGNED(2**N-1,N));
        --
        wait until rising_edge(clk);
        --
        -- ======== Power Off
        tcase   <= -1;
        wait until rising_edge(clk);
        --
        wait for 666 us;
        wait until rising_edge(clk);
        rst        <= '0';
        wait for 333 ns;
        en_clk     <= '0';
        wait for 333 ns;
        --
        if err_counter /= 0 then
            REPORT "... ==|[ TEST FAILED ]|== ...";
        else
            REPORT "... ==|[ TEST SUCCESS ]|== ...";
        end if;
        REPORT "... ==|[ err_counter: " & integer'image(err_counter) & " ]|== ...";
        --
        -- ASSERT FALSE
        --     REPORT "... ==|[ proc_drive: SIMULATION END ]|== ..."
        --         SEVERITY FAILURE;
        --
        REPORT "... ==|[ proc_drive: SIMULATION END ]|== ...";
        --
        wait;
    end process proc_drive;


end beh;
