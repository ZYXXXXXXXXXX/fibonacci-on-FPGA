----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/22 17:25:12
-- Design Name: 
-- Module Name: separator - Behavioral
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

entity separator is
Port ( 
char1,char2,char3,char4,char5,char6,char7,char8,char9,char10,char11: out std_logic_vector(3 downto 0);
data:in std_logic_vector(43 downto 0)
);
end separator;

architecture Behavioral of separator is


begin
    char1<=data(3 downto 0);
    char2<=data(7 downto 4);
    char3<=data(11 downto 8);
    char4<=data(15 downto 12);
    char5<=data(19 downto 16);
    char6<=data(23 downto 20);
    char7<=data(27 downto 24);
    char8<=data(31 downto 28);
    char9<=data(35 downto 32);
    char10<=data(39 downto 36);
    char11<=data(43 downto 40);

end Behavioral;
