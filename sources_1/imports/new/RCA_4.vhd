----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 11:45:47 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( 
           A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           C_in : in STD_LOGIC;
           S: out STD_LOGIC_VECTOR(3 DOWNTO 0);
           OverFlow : out STD_LOGIC;
           Zero: out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

COMPONENT FA
    PORT(
    A: IN STD_LOGIC;
    B: IN STD_LOGIC;
    C_in: IN STD_LOGIC;
    S: OUT STD_LOGIC;
    C_out: OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C: STD_LOGIC;
signal SB0,SB1,SB2,SB3: STD_LOGIC;
SIGNAL S0,S1,S2,S3: STD_LOGIC;

begin
SB0 <= B(0) XOR C_in;
SB1 <= B(1) XOR C_in;
SB2 <= B(2) XOR C_in;
SB3 <= B(3) XOR C_in;

FA_0: FA 
    PORT MAP(
        A => A(0),
        B => SB0,
        C_in => C_in,
        S => S0,
        C_out => FA0_C);
        
FA_1: FA 
    PORT MAP(
        A => A(1),
        B => SB1,
        C_in => FA0_C,
        S => S1,
        C_out => FA1_C);
                
FA_2: FA 
    PORT MAP(
        A => A(2),
        B => SB2,
        C_in => FA1_C,
        S => S2,
        C_out => FA2_C);
        
FA_3: FA 
            PORT MAP(
                A => A(3),
                B => SB3,
                C_in => FA2_C,
                S => S3,
                C_out => FA3_C);
S(0) <= S0;
S(1) <= S1;
S(2) <= S2;
S(3) <= S3; 
OverFlow <= FA3_C XOR FA2_C;               
Zero <= NOT(S3) AND NOT(S2) AND NOT(S1) AND NOT(S0);
end Behavioral;
