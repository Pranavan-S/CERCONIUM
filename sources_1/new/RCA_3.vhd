----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:20:56 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
Port ( 
           A: in STD_LOGIC_VECTOR(2 DOWNTO 0);
           S: out STD_LOGIC_VECTOR(2 DOWNTO 0);
           OverFlow : out STD_LOGIC
      );
end RCA_3;

architecture Behavioral of RCA_3 is
COMPONENT FA
    PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        C_in: IN STD_LOGIC;
        S: OUT STD_LOGIC;
        C_out: OUT STD_LOGIC
    );
END COMPONENT;
SIGNAL FA0_C, FA1_C: STD_LOGIC;
SIGNAL S0,S1,S2: STD_LOGIC;

begin


FA_0: FA 
    PORT MAP(
        A => A(0),
        B => '1',
        C_in => '0',
        S => S0,
        C_out => FA0_C);
        
FA_1: FA 
    PORT MAP(
        A => A(1),
        B => '0',
        C_in => FA0_C,
        S => S1,
        C_out => FA1_C);
                
FA_2: FA 
    PORT MAP(
        A => A(2),
        B => '0',
        C_in => FA1_C,
        S => S2,
        C_out => OverFlow);
        

S(0) <= S0;
S(1) <= S1;
S(2) <= S2;


end Behavioral;
