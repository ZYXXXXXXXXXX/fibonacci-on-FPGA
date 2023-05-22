----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/17 18:58:28
-- Design Name: 
-- Module Name: fibo_FSM - Behavioral
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

entity fibo_FSM is
    Port (CLK,RESET,start:in std_logic;
         n:in std_logic_vector(5 downto 0);
         ready: out std_logic;
         r: out std_logic_vector(43 downto 0)--output
        );
end fibo_FSM;

architecture Behavioral of fibo_FSM is
    type state_type is(idle,out_state,load,op);
    signal state_reg,state_next:state_type;
    signal temp_reg,temp_next:std_logic_vector(5 downto 0);
    signal sum_1_reg,sum_2_reg,sum_1_next,sum_2_next:std_logic_vector(43 downto 0);
    signal r_reg,r_next:std_logic_vector(43 downto 0);

begin
    -- state and data registers
    process
(CLK, RESET) is
    begin
        if RESET = '1' then
            state_reg <= idle;
            temp_reg<="000000";
            sum_1_reg<=x"00000000000";
            sum_2_reg<=x"00000000000";
            r_reg<=x"00000000000";
        elsif CLK'event and CLK='1' then
            state_reg <= state_next;
            temp_reg <= temp_next;
            sum_1_reg <= sum_1_next;
            sum_2_reg <= sum_2_next;
            r_reg<=r_next;
        end if;
    end process;

    process(start,state_reg,temp_reg,sum_1_reg,sum_2_reg,n)is
    begin
        temp_next<= temp_reg;
        sum_1_next <= sum_1_reg;
        sum_2_next <= sum_2_reg;
        r_next<=r_reg;
        ready<='0';
        case state_reg is
            when idle=>
                if start ='1'then
                    if(n<"000010")then
                        state_next<=out_state;
                    else
                        state_next<=load;
                    end if;
                else
                    state_next<=idle;
                end if;
                ready<='1';
            when out_state=> --n<3
                if n="000000"then
                    r_next<=x"00000000000";
                elsif n<="000001"then
                    r_next<=x"00000000001";
                else
                    r_next<=x"FFFFFF0FFFF";
                end if;
                state_next<=idle;
            when load=> --when n>=2
            --initial
                sum_2_next<=x"00000000000";
                sum_1_next<=x"00000000001";
                temp_next<="000001";
                state_next<=op;
                
            when op=>
                if (temp_reg=n)then
                    r_next<=sum_1_reg;--output
                    state_next<=idle;
                else
                    --sum_next<=sum_1_reg+sum_2_reg;
                    temp_next<=temp_reg+1;
                    sum_1_next<=sum_1_reg+sum_2_reg;
                    sum_2_next<=sum_1_reg;
                    state_next<=op;
                end if;
        end case;
    end process;
    r<=r_reg;
end Behavioral;
