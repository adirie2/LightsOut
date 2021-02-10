----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 08:26:50 PM
-- Design Name: 
-- Module Name: decoder4to9 - Behavioral
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

entity decoder4to9 is
  Port (w : in std_logic_vector(1 to 4);
        en : in std_logic;
        y : out std_logic_vector(1 to 9));
end decoder4to9;

architecture Behavioral of decoder4to9 is
signal enw : std_logic_vector(1 to 5);
begin
enw <= en & w;
with enw select y <=
    "000000000" when "10000",
    "000000001" when "10001",
    "000000010" when "10010",
    "000000100" when "10011",
    "000001000" when "10100",
    "000010000" when "10101",
    "000100000" when "10110",
    "001000000" when "10111",
    "010000000" when "11000",
    "100000000" when "11001",
    "000000000" when others;
end Behavioral;
