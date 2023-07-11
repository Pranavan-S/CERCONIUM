----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 04:21:43 PM
-- Design Name: 
-- Module Name: MUX_2W_3b - Behavioral
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

entity MUX_2W_3b is
    Port ( En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2W_3b;

architecture Behavioral of MUX_2W_3b is
component MUX_2_to_1
    Port ( En : in STD_LOGIC;
           I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
 MUX_2_to_1_0: MUX_2_to_1
    port map(
        En => En,
        S => Sel,
        I0 => I0(0),
        I1 => I1(0),
        Y => Y(0)
    );
MUX_2_to_1_1: MUX_2_to_1
    port map(
        En => En,
        S => Sel,
        I0 => I0(1),
        I1 => I1(1),
        Y => Y(1)
    );
MUX_2_to_1_2: MUX_2_to_1
    port map(
        En => En,
        S => Sel,
        I0 => I0(2),
        I1 => I1(2),
        Y => Y(2)
    );
end Behavioral;
