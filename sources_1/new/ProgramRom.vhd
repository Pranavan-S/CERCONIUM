----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:43:30 PM
-- Design Name: 
-- Module Name: ProgramRom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramRom is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramRom;

architecture Behavioral of ProgramRom is
type rom_type is array(0 to 7) of  std_logic_vector(11 downto 0);
--signal Instructions: rom_type:= (
--     "100100000001" --MOV R2, 1
--    ,"100110000001" --MOV R3, 1
--    ,"000010100000" --ADD R1, R2
--    ,"000100110000" --ADD R2, R3
--    ,"000010100000" --ADD R1, R2
--    ,"000100110000" --ADD R2, R3
--    ,"000010100000" --ADD R1, R2
--    ,"110000000111" --JZR R0, 7
--    );
signal Instructions: rom_type:= (
         "100100000011" --MOV R2, 3   --ROM 0
        ,"100110000001" --MOV R3, 1   --ROM 1
        ,"010110000000" --NEG R3      --ROM 2
        ,"001110100000" --ADD R7, R2  --ROM 3
        ,"000100110000" --ADD R2, R3  --ROM 4
        ,"110100000101" --JZR R2, 5   --ROM 5
        ,"110000000011" --JZR R0, 3   --ROM 6
        ,"000000000000"               --ROM 7
        );
    
    
--signal Instructions: rom_type:= (
--     "100010001010" --MOV R1, 10
--    ,"100100000001" --MOV R2, 1
--    ,"010100000000" --NEG R2
--    ,"000010100000" --ADD R1, R2
--    ,"110010000111" --JZR R1, 7
--    ,"110000000011" --JZR R0, 3
--    ,"000000000000"
--    ,"000000000000"
--    );

begin
I <= Instructions(to_integer(unsigned(A)));
end Behavioral;
