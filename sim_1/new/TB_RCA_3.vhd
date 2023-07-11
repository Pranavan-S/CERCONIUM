----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:29:08 PM
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is
COMPONENT RCA_3
    Port ( 
           A: in STD_LOGIC_VECTOR(2 DOWNTO 0);
           S: out STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
END COMPONENT;

SIGNAL A0, A1, A2, S0, S1, S2: STD_LOGIC;

begin
UUT: RCA_3
    PORT MAP(
    A(0) => A0,
    A(1) => A1,
    A(2) => A2,

    S(0) => S0,
    S(1) => S1,
    S(2) => S2
    );
    
PROCESS
BEGIN
    
    A0 <= '1';
    A1 <= '1';
    A2 <= '1';
    
    
    
    WAIT FOR 400 ns;
        
        A0 <= '1';
        A1 <= '0';
        A2 <= '0';
    WAIT;
    
    
END PROCESS;

end Behavioral;