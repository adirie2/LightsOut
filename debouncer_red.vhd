----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2020 02:49:28 PM
-- Design Name: 
-- Module Name: debouncer_red - Behavioral
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

entity debouncer_red is
  generic (K: integer := 20; DD : integer:=1000000);
  Port (input, rst, clk : in std_logic;
        red_out : out std_logic);
end debouncer_red;

architecture Behavioral of debouncer_red is
signal db_out : std_logic;
signal debounce_out : std_logic;
begin
debounce_out <= db_out;
debounce : entity work.debouncer(behavioral)
    generic map (K=>K, DD=>DD)
    port map(reset=>rst, input=>input, clk=>clk, output=>db_out);
redclk : entity work.red(behavioral)
    port map(reset=>rst, input=>db_out, clk=>clk, output=>red_out);
end Behavioral;
