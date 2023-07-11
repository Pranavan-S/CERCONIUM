----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 03:10:53 PM
-- Design Name: 
-- Module Name: TB_MUX_8W_4b - Behavioral
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

entity TB_MUX_8W_4b is
--  Port ( );
end TB_MUX_8W_4b;

architecture Behavioral of TB_MUX_8W_4b is
component MUX_8W_4b
    Port ( En : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal En: std_logic;
signal Sel: std_logic_vector(2 downto 0);
signal I0,I1,I2,I3,I4,I5,I6,I7,Y: std_logic_vector(3 downto 0);

begin
UUT: MUX_8W_4b
    port map(
        En => En,
        Sel =>Sel,
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        Y => Y
    );
process
begin
    En <= '0';
    Sel <= "101";
    I0 <= "1111";
    I1 <= "1111";
    I2 <= "1111";
    I3 <= "1111";
    I4 <= "1111";
    I5 <= "0101";
    I6 <= "1111";
    I7 <= "1111";
    wait for 200 ns;
    
    En <= '1';
    Sel <= "100";
    I0 <= "1111";
    I1 <= "1111";
    I2 <= "1111";
    I3 <= "1111";
    I4 <= "1001";
    I5 <= "0101";
    I6 <= "1111";
    I7 <= "1111";
    wait ;            
end process;
end Behavioral;
