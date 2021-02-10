----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 06:27:03 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
  Port (sw : in std_logic_vector(1 to 9);
      clk, BTNU, BTNC, BTND, SW0 : in std_logic;
      AN : out std_logic_vector(3 downto 0);
      SEG : out std_logic_vector(6 downto 0)
      );
end top_level;

architecture Behavioral of top_level is
signal SWp :  std_logic_vector(1 to 9);
signal RSTp, STARTp, WINp :  std_logic;
signal EN_LFSR, INIT_LIGHTS, START_TIMER, EN_TIMER, TOGGLE_ALL, WIN, END_TIMER : std_logic;
signal SSEG3, SSEG2, SSEG1 : std_logic_vector(2 downto 0);
begin
--switches : for i in 1 to 9 generate
--debouncers_s : entity work.debouncer_red(behavioral)
--    port map ( input=>SW(i), rst=>'0', clk=>clk, red_out=>SWp(i));
--end generate;
--debouncer_u : entity work.debouncer_red(behavioral)
--    generic map (K=>20, DD=>1000000)
--    port map ( input=>BTNU, rst=>'0', clk=>clk, red_out=>RSTp);
--debouncer_c : entity work.debouncer_red(behavioral)
--    generic map (K=>20, DD=>1000000)
--    port map ( input=>BTNc, rst=>'0', clk=>clk, red_out=>STARTp);
--debouncer_d : entity work.debouncer_red(behavioral)
--    generic map (K=>20, DD=>1000000)
--    port map ( input=>BTNd, rst=>'0', clk=>clk, red_out=>WINp);
input : entity work.input_interface(Behavioral)
 port map (SW=>SW, clk=>clk, BTNU=>BTNU, BTNC=>BTNC, BTND=>BTND, SWp=>SWp ,RSTp=>RSTp, STARTp=>STARTp, WINp=>WINp);
datap : entity work.datapath(Behavioral)
 port map (SWp=>SWp, SW0=>SW0, RSTp=>RSTp, clk=>clk, EN_LFSR=>EN_LFSR, INIT_LIGHTS=>INIT_LIGHTS, START_TIMER=>START_TIMER, EN_TIMER=>EN_TIMER, TOGGLE_ALL=>TOGGLE_ALL, WIN=>WIN, END_TIMER=>END_TIMER, SSEG3=>SSEG3, SSEG2=>SSEG2, SSEG1=>SSEG1);
control : entity work.controller(Behavioral)
 port map (clk=>clk, STARTp=>STARTp, WINp=>WINp, RSTp=>RSTp, EN_LFSR=>EN_LFSR, INIT_LIGHTS=>INIT_LIGHTS, START_TIMER=>START_TIMER, EN_TIMER=>EN_TIMER, TOGGLE_ALL=>TOGGLE_ALL, WIN=>WIN, END_TIMER=>END_TIMER);
output : entity work.ssd_driver(dataflow)
 port map (clk=>clk, AN=>AN, SEG=>SEG, hex0=>SSEG1, hex1=>SSEG2, hex2=>SSEG3);
end Behavioral;
