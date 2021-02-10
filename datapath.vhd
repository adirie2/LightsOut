----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 08:52:38 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
  generic (K :integer := 28); --3
  Port (SWp : in std_logic_vector(1 to 9);
        SW0, clk, RSTp, EN_LFSR, init_lights, start_timer, en_timer, toggle_all : in std_logic;
        win, end_timer : out std_logic;
        SSEG3, SSEG2, SSEG1 : out std_logic_vector(1 to 3));
end datapath;

architecture Behavioral of datapath is
signal RT, NT, Q : std_logic_vector(1 to 9);
signal SEG : std_logic_vector(1 to 9);
signal Q_reg : std_logic_vector(K-1 downto 0);
signal AN : std_logic_vector(1 to 4);
begin
win <= not (Seg(1) or Seg(2) or Seg(3) or Seg(4) or Seg(5) or Seg(6) or Seg(7) or Seg(8) or Seg(9));
neighbors : entity work.neighbors(mixed)
    port map(L=>SWp, SW0=>SW0, NT=>NT);
LFSR : entity work.LFSR(Behavioral)
    port map(clk=>clk, en=>en_lfsr, init=>rstp, RT=>RT);
storage : entity work.storage(Behavioral)
    port map(NT=>NT, RT=>RT, rst=>rstp, clk=>clk, init_lights=>init_lights, toggle_all=>toggle_all, Q=>SEG);
seg_decoder : entity work.ssd_converter(Behavioral)
    port map(SSEG1=>SSEG1, SSEG2=>SSEG2, SSEG3=>SSEG3, SEG=>SEG);
--SSEG1 <= SEG(7 to 9);
--SSEG2 <= SEG(4 to 6);
--SSEG3 <= SEG(1 to 3);
--output_interface : entity work.ssd_driver(dataflow)
--    generic map ( K => 17)
--    port map(Hex0=>SEG(1 to 3), Hex1=>SEG(4 to 6), Hex2=>SEG(7 to 9), clk=>clk, rst=>rstp, SEG=>SSEG, AN=>AN);
registerino : process(clk)
begin
    if rising_edge(clk) then 
        if (start_timer = '1') then
        Q_reg <= (others=>'0');
        elsif en_timer = '1' then
        Q_reg <= std_logic_vector(unsigned(Q_reg) + 1);
        end if;
    end if;
end process;
end_timer <= '1' when to_integer(unsigned(Q_reg)) = 100000000  else '0'; --100
end Behavioral;
