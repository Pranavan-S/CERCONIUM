----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 05:02:33 PM
-- Design Name: 
-- Module Name: TB_ProgramRom - Behavioral
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

entity TB_ProgramRom is
--  Port ( );
end TB_ProgramRom;

architecture Behavioral of TB_ProgramRom is
component ProgramRom
 Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
        I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal I: std_logic_vector(11 downto 0);
signal A: std_logic_vector(2 downto 0);

begin
UUT: ProgramRom
    port map(
        A => A,
        I => I
    );
process
begin
    A <= "000";
    wait for 100 ns;
    A <= "001";
    wait for 100 ns;
    A <= "010";
    wait for 100 ns;
    A <= "011";
    wait for 100 ns;
    A <= "100";
    wait for 100 ns;
    A <= "101";
    wait for 100 ns;
    A <= "110";
    wait for 100 ns;
    A <= "111";
    wait for 100 ns;
    wait;
    
end process;

end Behavioral;
