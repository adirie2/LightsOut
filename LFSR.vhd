----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 08:52:38 PM
-- Design Name: 
-- Module Name: LFSR - Behavioral
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

entity LFSR is
  Port (init, en, clk : in std_logic;
        RT : out std_logic_vector(1 to 9));
end LFSR;

architecture Behavioral of LFSR is
component FF is
  Port (D, en, rst, set, clk: in std_logic;
        Q : out std_logic );
end component;
signal D : std_logic_vector(0 to 9) := (others=>'0');
signal reset : std_logic_vector(0 to 8);
signal set : std_logic_vector(0 to 8);
begin
set <= '0' & init & '0' & init & '0' & init & '0' & init & '0';
reset <= init & '0' & init & '0' & init & '0' & init & '0' & init;
D(0) <= D(4) xor D(9);
G1 : for i in 0 to 8 generate
    ffs : FF port map (D=>D(i), en=>en, rst=>reset(i), set=>set(i), clk=>clk, Q=>D(i+1));
    RT(i+1) <= D(i+1);
end generate;
--Q <= D(1 to 9);
end Behavioral;
