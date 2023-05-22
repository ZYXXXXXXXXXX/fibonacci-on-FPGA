----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 11:23:12
-- Design Name: 
-- Module Name: compute_current - Behavioral
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

entity compute_current is
Port (
enable,CLK,reset:in std_logic;
current_control:out std_logic_vector(2 downto 0)
 );
end compute_current;

architecture Behavioral of compute_current is

signal counter:std_logic_vector(16 downto 0);
signal temp:std_logic_vector(2 downto 0):="000";
begin

process(CLK,reset,enable)is
begin
if(CLK'event and CLK='1')then
    -- if(reset='1')then
        --counter<="00000000000000000000";
        --temp<="000";
    if (counter="11000011010100000")then 
        counter<="00000000000000000";
        temp<=temp+1;
    else
        counter<=counter+1;
     end if;
end if;
end process;

current_control<=temp;

end Behavioral;
