----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 03:40:07 PM
-- Design Name: 
-- Module Name: ROMS - Behavioral
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

entity ROMS is
  Port (address : in std_logic_vector(1 to 4);
        Q : out std_logic_vector(1 to 16) );
end ROMS;

architecture Behavioral of ROMS is
type rom is
    array (1 to 4, 1 to 9) of std_logic_vector(0 to 3);
type rom_one is
    array (1 to 9) of std_logic_vector(1 to 16);
--signal roms : rom := ((x"2", x"1", x"2", x"1", x"2", x"3", x"4", x"5", x"6"),
--                    (x"4", x"3", x"6", x"5", x"4", x"5", x"8", x"7", x"8"),
--                    (x"0", x"5", x"0", x"7", x"6", x"9", x"0", x"9", x"0"),
--                    (x"0", x"0", x"0", x"0", x"8", x"0", x"0", x"0", x"0"));
signal roms : rom_one := (x"2400", x"1350", x"2600", x"1570", x"2468", x"3590", x"4800", x"5790", x"6800");
begin
with address select Q <=
    roms(1) when "0001",
    roms(2) when "0010",
    roms(3) when "0011",
    roms(4) when "0100",
    roms(5) when "0101",
    roms(6) when "0110",
    roms(7) when "0111",
    roms(8) when "1000",
    roms(9) when "1001",
    x"0000" when others;
    

end Behavioral;
