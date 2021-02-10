----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 04:51:09 PM
-- Design Name: 
-- Module Name: ssd_converter - Behavioral
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

entity ssd_converter is
  Port (SEG : in std_logic_vector(1 to 9);
        SSEG1, SSEG2, SSEG3 : out std_logic_vector(1 to 3));
end ssd_converter;

architecture Behavioral of ssd_converter is

begin
SSEG1 <= SEG(7 to 9);
SSEG2 <= SEG(4 to 6);
SSEG3 <= SEG(1 to 3);
end Behavioral;
