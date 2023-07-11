----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 06:18:01 PM
-- Design Name: 
-- Module Name: TB_MUX_2W_3b - Behavioral
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

entity TB_MUX_2W_3b is
--  Port ( );
end TB_MUX_2W_3b;

architecture Behavioral of TB_MUX_2W_3b is
component MUX_2W_3b
    Port ( En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal En,Sel: std_logic;
signal I0,I1,Y: std_logic_vector(2 downto 0);

begin
UUT: MUX_2W_3b
    port map(
        En => En,
        Sel => Sel,
        I0 => I0,
        I1 => I1,
        Y => Y
    );
process 
begin
    En <= '1';
    Sel <= '0';
    I0 <= "111";
    I1 <= "101";
    
    wait for 200 ns;
    
    En <= '1';
    Sel <= '1';
    I0 <= "111";
    I1 <= "101";

    wait ;   
end process;
end Behavioral;
