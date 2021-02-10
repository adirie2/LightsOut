----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2020 10:51:32 AM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
  generic (K :integer);
  Port (en, rst, ld, clk : in std_logic;
          Q : out std_logic_vector(K-1 downto 0));
end counter;

architecture Behavioral of counter is
signal Qt : std_logic_vector(K-1 downto 0) := (others=>'0');
begin
process(clk)
begin
if rising_edge(clk) then
    if rst = '1' then
        Qt <= (others => '0');
    elsif en = '1' then
        Qt <= std_logic_vector(unsigned(Qt) + 1);
    elsif ld = '1' then
        Qt <= (others => '0');
    end if;
  end if;
end process;
Q <= Qt;
end Behavioral;
