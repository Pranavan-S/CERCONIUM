----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2023 03:59:44 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
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
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
component Decoder_3_to_8
    port(I: in std_logic_vector;
    EN: in std_logic;
    Y: out std_logic_vector);
end component;  

signal DS0: std_logic_vector(7 downto 0);
signal DS1: std_logic_vector(4 downto 0);
signal DS2: std_logic_vector(1 downto 0);
signal SEL: std_logic_vector(7 downto 0);

begin

Selector: Decoder_3_to_8
    port map(
    I => S,
    EN => EN,
    Y => SEL);
    
DS0(7) <= SEL(7) and D7;
DS0(6) <= SEL(6) and D6;
DS0(5) <= SEL(5) and D5;
DS0(4) <= SEL(4) and D4;
DS0(3) <= SEL(3) and D3;
DS0(2) <= SEL(2) and D2;
DS0(1) <= SEL(1) and D1;
DS0(0) <= SEL(0) and D0;

DS1(3) <= DS0(7) or DS0(6);
DS1(2) <= DS0(5) or DS0(4);
DS1(1) <= DS0(3) or DS0(2);
DS1(0) <= DS0(1) or DS0(0);

DS2(1) <= DS1(3) or DS1(2);
DS2(0) <= DS1(1) or DS1(0);

Y <= DS2(0) or DS2(1); 


end Behavioral;