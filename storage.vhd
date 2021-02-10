----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 01:57:26 PM
-- Design Name: 
-- Module Name: storage - Behavioral
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

entity storage is
  Port (init_lights, toggle_all, rst, clk : in std_logic;
         NT, RT : in std_logic_vector(1 to 9);
         Q : out std_logic_vector(1 to 9));
end storage;

architecture Behavioral of storage is
component FF is
  Port (D, en, rst, set, clk: in std_logic;
        Q : out std_logic );
end component;
signal EN : std_logic_vector(1 to 9);
signal Qt : std_logic_vector(1 to 9);
signal D : std_logic_vector(1 to 9);
begin
FFModule : for i in 1 to 9 generate
    EN(i) <= ((RT(i) and init_lights) or toggle_all or NT(i));
    D(i) <= not Qt(i);
    ffs : FF port map (D(i), EN(i), rst, '0', clk, Qt(i));
end generate;
Q <= Qt;
end Behavioral;
