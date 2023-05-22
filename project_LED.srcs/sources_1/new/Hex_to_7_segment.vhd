----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/04 22:16:19
-- Design Name: 
-- Module Name: Hex_to_7_segment - Behavioral
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

entity Hex_to_7_segment is
    Port (
        hex_number: in std_logic_vector(3 downto 0);
        c_control:out std_logic_vector(7 downto 0)

    );
end Hex_to_7_segment;

architecture Behavioral of Hex_to_7_segment is
    signal output_value : std_logic_vector(7 downto 0) := "11111111";

begin
    process(hex_number) is

    begin
        case hex_number is
            when "0000" =>
                c_control <= "00000011";
            when "0001" =>
                c_control <= "10011111";
            when "0010"=>
                c_control<="00100101";
            when"0011"=>
                c_control<="00001101";
            when"0100"=>
                c_control<="10011001";
            when"0101"=>
                c_control<="01001001";
            when"0110"=>
                c_control<="01000001";
            when"0111"=>
                c_control<="00011111";
            when"1000"=>
                c_control<="00000001";
            when"1001"=>
                c_control<="00001001";
            when "1010"=>
                c_control<="00010001";
            when "1011"=>
                c_control<="11000001";
            when "1100"=>
                c_control<="01100011";
            when"1101"=>
                c_control<="10000101";
            when"1110"=>
                c_control<="01100001";
            when"1111"=>
                c_control<="01110001";
            when others=>
                c_control<="01110001";

        end case;

    end process;

end Behavioral;
