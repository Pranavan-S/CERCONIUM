----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 12:13:15 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is
COMPONENT RCA_4
    Port ( 
           A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           C_in : in STD_LOGIC;
           S: out STD_LOGIC_VECTOR(3 DOWNTO 0);
           OverFlow : out STD_LOGIC;
           Zero: out STD_LOGIC);
END COMPONENT;

SIGNAL A0, A1, A2, A3, B0, B1, B2, B3, C_in, S0, S1, S2, S3, C_out,Zero: STD_LOGIC;

begin
UUT: RCA_4
    PORT MAP(
    A(0) => A0,
    A(1) => A1,
    A(2) => A2,
    A(3)=> A3,
    B(0) => B0,
    B(1) => B1,
    B(2) => B2,
    B(3) => B3,
    C_in => C_in,
    S(0) => S0,
    S(1) => S1,
    S(2) => S2,
    S(3) => S3,
    OverFlow => C_out,
    Zero => Zero
    );
    
PROCESS
BEGIN
    C_in <= '0';
    
    A0 <= '1';
    A1 <= '1';
    A2 <= '1';
    A3 <= '1';
    
    B0 <= '1';
    B1 <= '1';
    B2 <= '1';
    B3 <= '1';
    
    
    
    WAIT FOR 400 ns;
    C_in <= '1';
        
        A0 <= '1';
        A1 <= '1';
        A2 <= '1';
        A3 <= '1';
        
        B0 <= '1';
        B1 <= '1';
        B2 <= '1';
        B3 <= '1';
    
    WAIT;
    
    
END PROCESS;

end Behavioral;
