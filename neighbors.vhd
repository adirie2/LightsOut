----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 04:40:51 PM
-- Design Name: 
-- Module Name: neighbors - mixed
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

entity neighbors is
  Port (SW0 : in std_logic;
        L : in std_logic_vector(1 to 9);
        NT : out std_logic_vector(1 to 9));
end neighbors;

architecture mixed of neighbors is
component decoder4to9 is
Port (w : in std_logic_vector(1 to 4);
        en : in std_logic;
        y : out std_logic_vector(1 to 9));
end component;
component ROMS is
  Port (address : in std_logic_vector(1 to 4);
        Q : out std_logic_vector(1 to 16) );
end component;
type decoder_out is 
array(1 to 4) of std_logic_vector(1 to 9);
signal decoder_outs : decoder_out ;
signal Z : std_logic;
signal Enout : std_logic_vector(1 to 4);
signal lout : std_logic_vector(1 to 9);
signal romo : std_logic_vector(1 to 16);
begin
--Enin <= L1&L2&L3&L4&L5&L6&L7&L8&L9;
with L select Enout <=
    x"0" when "000000000",
    x"1" when "000000001",
    x"2" when "000000010",
    x"3" when "000000100",
    x"4" when "000001000",
    x"5" when "000010000",
    x"6" when "000100000",
    x"7" when "001000000",
    x"8" when "010000000",
    x"9" when "100000000",
    x"0" when others;
Z <= '0' when Enout = x"0" else '1';
louts : for i in 1 to 9 generate
lout(i) <= SW0 and L(i);
end generate;
rom : ROMS port map (Enout, romo);
DEC : for i in 0 to 3 generate
decoders : decoder4to9 port map(romo(4*i+1 to 4+4*i), Z, decoder_outs(i+1));
end generate;
NTs : for i in 1 to 9 generate
NT(i) <= lout(i) or decoder_outs(1)(i) or decoder_outs(2)(i) or decoder_outs(3)(i) or decoder_outs(4)(i);
end generate;
end mixed;
