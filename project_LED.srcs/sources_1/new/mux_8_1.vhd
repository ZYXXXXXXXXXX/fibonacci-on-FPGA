----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 10:54:31
-- Design Name: 
-- Module Name: mux_8_1 - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_8_1 is
Port ( 
char1,char2,char3,char4,char5,char6,char7,char8: in std_logic_vector(3 downto 0);
control:in std_logic_vector(2 downto 0);
char_out:out std_logic_vector(3 downto 0)
);
end mux_8_1;

architecture Behavioral of mux_8_1 is
begin
process(control)is
begin
case control is
    when "000" =>
    char_out <= char1; -- LED[0] is for the decimal point
    when "001" => 
    char_out <= char2;
    when "010"=>
    char_out<=char3;
    when"011"=>
    char_out<=char4;
    when"100"=>
    char_out<=char5;
    when"101"=>
    char_out<=char6;
    when"110"=>
    char_out<=char7;
    when"111"=>
    char_out<=char8;
    when others=>
    char_out<=char1;
end case;

end process;


end Behavioral;
