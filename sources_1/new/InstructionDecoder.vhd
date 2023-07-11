----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 09:11:14 PM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           RegChk : in STD_LOGIC_VECTOR (3 downto 0);
           A_S_Sel : out STD_LOGIC;
           LoadSel : out STD_LOGIC;
           JumpFlag : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (2 downto 0);
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelA : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelB : out STD_LOGIC_VECTOR (2 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal OP_Sel: std_logic_vector(1 downto 0);
signal Decoded_OP: std_logic_vector(3 downto 0);
begin

OP_Sel <= I(11 downto 10);

Ins_Dec: Decoder_2_to_4
    port map(
        I => OP_Sel,
        EN => '1',
        Y => Decoded_OP
    );
LoadSel <= Decoded_OP(2);
A_S_Sel <= (not Decoded_OP(0)) and Decoded_OP(1);
JumpFlag <= Decoded_OP(3) and (not (RegChk(0) or RegChk(1) or RegChk(2) or RegChk(3)));
JumpAdd <= I(2 downto 0);
Imm_Val <= I(3 downto 0);
RegSelA <= I(6 downto 4);
RegSelB <= I(9 downto 7);
RegEn <= I(9 downto 7); 
end Behavioral;
