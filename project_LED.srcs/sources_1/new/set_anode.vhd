----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 11:46:07
-- Design Name: 
-- Module Name: set_anode - Behavioral
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

entity set_anode is
Port (
b: in std_logic_vector(2 downto 0);
AN:out std_logic_vector(7 downto 0)
 );
end set_anode;

architecture Behavioral of set_anode is

begin
process(b)is
begin
case b is
    when "000" =>
    AN <= "11111110";
    when "001" => 
    AN <= "11111101";
    when "010"=>
    AN<="11111011";
    when"011"=>
    AN<="11110111";
    when"100"=>
    AN<="11101111";
    when"101"=>
    AN<="11011111";
    when"110"=>
    AN<="10111111";
    when"111"=>
    AN<="01111111";
    when others=>
    AN <= "01111111";
end case;
end process;

end Behavioral;
