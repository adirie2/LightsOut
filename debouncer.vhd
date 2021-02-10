----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2020 11:17:52 AM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
  generic ( K : integer; DD : integer);
  Port (reset, input, clk : in std_logic;
        output : out std_logic);
end debouncer;

architecture Behavioral of debouncer is
signal prev_input : std_logic;
signal outputff2 : std_logic;
signal inputff2 : std_logic;
signal inputff3 : std_logic;
signal set : std_logic;
signal count : std_logic;
signal ddcheck : std_logic;
signal Q_k : std_logic_vector(K-1 downto 0);
begin
inputff2 <= input when count = '0' else outputff2;
set <= (prev_input xor input )and (not count);
ddcheck <= '1' when to_integer(unsigned(Q_k)) = DD-1 else '0';
inputff3 <= count when ddcheck = '1' else '0';
output <= outputff2;
ff1 : entity work.dr_synch(behavioral)
      port map ( d=>input, q=>prev_input, clk=>clk, rst=>reset);
ff2 : entity work.dr_synch(behavioral)
      port map (d=>inputff2, q=>outputff2, clk=>clk, rst=>reset);
ff3 : entity work.drs_synch(behavioral)
      port map (d=>inputff3, q=>count, clk=>clk, rst=>reset, set=>set);
counter : entity work.counter(behavioral)
      generic map (K => K)
      port map (en => count, clk=>clk, rst=>ddcheck, ld => reset, Q=>Q_k);
end Behavioral;
