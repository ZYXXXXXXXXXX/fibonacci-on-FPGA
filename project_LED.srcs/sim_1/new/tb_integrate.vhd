----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/05 18:11:37
-- Design Name: 
-- Module Name: tb_integrate - Behavioral
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

entity tb_integrate is
    --  Port ( );
end tb_integrate;

architecture Behavioral of tb_integrate is

    component design_1_wrapper is
        port(
            CLK,RESET,start_0:in std_logic;
            ready_0: out std_logic;
            char9_0,char10_0,char11_0:out std_logic_vector(3 downto 0);
            AN_0,c_control:out std_logic_vector(7 downto 0);
            n_0: in std_logic_vector(5 downto 0)
        );
    end component;

    signal CLK,RESET,start_0,ready_0:std_logic;
    signal AN_0,c_control: std_logic_vector(7 downto 0);
    signal n_0: std_logic_vector(5 downto 0);--in
    signal char9_0,char10_0,char11_0: std_logic_vector(3 downto 0);--output LED
begin

    clock_gen: process
        constant period : time := 100ns;
    begin
        CLK <= '0';
        CLK<='0';
        wait for period/2;
        CLK <= '1';
        CLK<='1';
        wait for period/2;
    end process;


    reset_process : process
    begin
        reset <= '1';
        for i in 1 to 2 loop
            wait until CLK = '1';
        end loop;
        reset <= '0';
        wait;
    end process;
    
    uut: design_1_wrapper port map(AN_0=>AN_0,CLK=>CLK,RESET=>RESET,c_control=>c_control,start_0=>start_0,n_0=>n_0,ready_0=>ready_0,char9_0=>char9_0,char10_0=>char10_0,char11_0=>char11_0);


end Behavioral;
