----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 05:06:28 PM
-- Design Name: 
-- Module Name: input_interface - Behavioral
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

entity input_interface is
  Port (SW : in std_logic_vector(1 to 9);
        clk, BTNU, BTNC, BTND : in std_logic;
        SWp : out std_logic_vector(1 to 9);
        RSTp, STARTp, WINp : out std_logic);
end input_interface;

architecture Behavioral of input_interface is
--signal db_out : std_logic_vector(1 to 9);
component debouncer_red
generic (K: integer := 20; DD : integer:=1000000);
  Port (input, rst, clk : in std_logic;
        red_out : out std_logic);
end component;
begin
switches : for i in 1 to 9 generate
debouncers_s : debouncer_red
    port map ( input=>SW(i), rst=>'0', clk=>clk, red_out=>SWp(i));
end generate;
debouncer_u : entity work.debouncer_red(behavioral)
    --generic map (K=>20, DD=>1000000)
    port map ( input=>BTNU, rst=>'0', clk=>clk, red_out=>RSTp);
debouncer_c : entity work.debouncer_red(behavioral)
   -- generic map (K=>20, DD=>1000000)
    port map ( input=>BTNc, rst=>'0', clk=>clk, red_out=>STARTp);
debouncer_d : entity work.debouncer_red(behavioral)
   -- generic map (K=>20, DD=>1000000)
    port map ( input=>BTNd, rst=>'0', clk=>clk, red_out=>WINp);
end Behavioral;
