----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 05:53:32 PM
-- Design Name: 
-- Module Name: controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
  Port ( Startp, Winp, RSTp, Win, end_timer, clk : in std_logic;
         en_lfsr, init_lights, start_timer, en_timer, toggle_all : out std_logic);
end controller;

architecture Behavioral of controller is
type state is (s_wait, s_play, s_win);
signal state_reg, state_next : state;

begin
EatMyMealy : Process( clk, RSTp)
begin
if(RSTp = '1') then
    state_reg <= s_wait;
elsif rising_edge(clk) then
    state_reg <= state_next;
end if;
end process;
next_state_output : process(state_reg, win, winp, startp, end_timer)
begin
state_next <= state_reg;
init_lights <= '0';
start_timer <= '0';
toggle_all <= '0';
start_timer <= '0';
en_lfsr <= '0';
en_timer <= '0';
case state_reg is
    when s_wait =>
        en_lfsr <= '1';
        if(startp = '1') then
        init_lights <= '1';
        state_next <= s_play;
        end if;
    when s_play =>
        if(win = '1' or winp = '1') then
            start_timer <= '1';
            state_next <= s_win;
        end if;
    when s_win =>
        en_timer <= '1';
        if(end_timer = '1') then
        toggle_all <= '1';
        start_timer <= '1';
        state_next <= s_win;
        end if;
end case;
end process;

end Behavioral;
