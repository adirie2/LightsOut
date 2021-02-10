library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ssd_driver is
    GENERIC (k: integer := 17); --17
    Port (Hex0, Hex1, Hex2     : in STD_LOGIC_VECTOR (2 downto 0);
          CLK   : in STD_LOGIC;
          AN         : out STD_LOGIC_VECTOR (3 downto 0);
          SEG        : out STD_LOGIC_VECTOR (6 downto 0) );
end ssd_driver;

architecture dataflow of ssd_driver is
    signal counter_up: unsigned(k-1 downto 0) := (others => '0');
    signal seg_decoder_in: STD_LOGIC_VECTOR(2 downto 0);
    signal decoder2t4: STD_LOGIC_VECTOR(3 downto 0);

begin

with counter_up(k-1 downto k-2) select
    seg_decoder_in <= --Hex0 when "00",
                      Hex0 when "01",
                      Hex1 when "10",
                      Hex2 when "11",
                      "000" when others;
                      
                      
                      
with counter_up(k-1 downto k-2) select
    decoder2t4 <= "0000" when "00",
                  "0010" when "01",
                  "0100" when "10",
                  "1000" when others;

AN <= not decoder2t4; --OC                              
 
process (CLK)
    begin
        if rising_edge(CLK) then
                counter_up <= counter_up + 1;
        end if;
            
    end process;
    
    with seg_decoder_in select
        
                seg <= "1111111" when "000", -- "0"     
                       "1110111" when "001", -- "1" 
                       "1111110" when "010", -- "2" 
                       "1110110" when "011", -- "3" 
                       "0111111" when "100", -- "4" 
                       "0110111" when "101", -- "5" 
                       "0111110" when "110", -- "6" 
                       "0110110" when "111", -- "7" 
--                       "1111110" when "000", -- "8"     
--                       "1110111" when "1001", -- "9" 
--                       "0001000" when "1010", -- a
--                       "1100000" when "1011", -- b
--                       "0110001" when "1100", -- C
--                       "1000010" when "1101", -- d
--                       "0110000" when "1110", -- E
                       "1111111" when others; -- F 

end dataflow;
