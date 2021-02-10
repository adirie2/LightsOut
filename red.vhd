----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2020 01:56:39 PM
-- Design Name: 
-- Module Name: red - Behavioral
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

entity red is
  Port (reset, input, clk : in std_logic;
        output : out std_logic);
end red;

architecture Behavioral of red is
signal Qt : std_logic := '0';
begin
process(clk)
begin
if rising_edge(clk) then
    if reset = '1' then
    Qt <= '0';
    else
    Qt <= input;
    end if;
end if;
end process;
output <= (not Qt) and input;
end Behavioral;
