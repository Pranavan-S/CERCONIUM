----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 02:51:00 PM
-- Design Name: 
-- Module Name: MUX_8W_4b - Behavioral
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

entity MUX_8W_4b is
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
end MUX_8W_4b;

architecture Behavioral of MUX_8W_4b is
component MUX_8_to_1
    Port ( D0: in STD_LOGIC;
           D1: in STD_LOGIC;
           D2: in STD_LOGIC;
           D3: in STD_LOGIC;
           D4: in STD_LOGIC;
           D5: in STD_LOGIC;
           D6: in STD_LOGIC;
           D7: in STD_LOGIC;           
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
MUX_8W_1b_0: MUX_8_to_1
    port map(
        EN => En,
        S =>Sel,
        D0 => I0(0),
        D1 => I1(0),
        D2 => I2(0),
        D3 => I3(0),
        D4 => I4(0),
        D5 => I5(0),
        D6 => I6(0),
        D7 => I7(0),
        Y => Y(0)
    );
MUX_8W_1b_1: MUX_8_to_1
    port map(
        EN => En,
        S =>Sel,
        D0 => I0(1),
        D1 => I1(1),
        D2 => I2(1),
        D3 => I3(1),
        D4 => I4(1),
        D5 => I5(1),
        D6 => I6(1),
        D7 => I7(1),
        Y => Y(1)
    );
MUX_8W_1b_2: MUX_8_to_1
    port map(
        EN => En,
        S =>Sel,
        D0 => I0(2),
        D1 => I1(2),
        D2 => I2(2),
        D3 => I3(2),
        D4 => I4(2),
        D5 => I5(2),
        D6 => I6(2),
        D7 => I7(2),
        Y => Y(2)
    );
MUX_8W_1b_3: MUX_8_to_1
    port map(
        EN => En,
        S =>Sel,
        D0 => I0(3),
        D1 => I1(3),
        D2 => I2(3),
        D3 => I3(3),
        D4 => I4(3),
        D5 => I5(3),
        D6 => I6(3),
        D7 => I7(3),
        Y => Y(3)
    );

end Behavioral;
