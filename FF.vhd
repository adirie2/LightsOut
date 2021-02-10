----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 06:40:27 PM
-- Design Name: 
-- Module Name: FF - Behavioral
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

entity FF is
  Port (D, en, rst, set, clk: in std_logic;
        Q : out std_logic );
end FF;

architecture Behavioral of FF is
signal Qt : std_logic := '0';
begin
process (clk)
begin
    if rising_edge(clk) then
            if rst = '1' then
                Qt <= '0';
            elsif set = '1' then
                Qt <= '1';
            elsif en = '1' then
                Qt <= D;
            end if;
    end if;
end process;
Q <= Qt;
end Behavioral;
