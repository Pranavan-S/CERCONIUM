----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 09:47:51 PM
-- Design Name: 
-- Module Name: TB_InstructionDecoder - Behavioral
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

entity TB_InstructionDecoder is
--  Port ( );
end TB_InstructionDecoder;

architecture Behavioral of TB_InstructionDecoder is
component InstructionDecoder
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
end component;

signal I: std_logic_vector(11 downto 0);
signal RegChk, Imm_Val: std_logic_vector(3 downto 0);
signal JumpAdd, RegSelA, RegSelB, RegEn: std_logic_vector(2 downto 0);
signal A_S_Sel, LoadSel, JumpFlag: std_logic;

begin
UUT: InstructionDecoder
    port map(
        I => I,
        RegChk => RegChk,
        A_S_Sel => A_S_Sel,
        LoadSel => LoadSel,
        JumpFlag => JumpFlag,
        JumpAdd => JumpAdd,
        Imm_Val => Imm_Val,
        RegSelA => RegSelA,
        RegSelB => RegSelB,
        RegEn => RegEn           
    );
process
begin
    I <= "100010001010";
    RegChk <= "1100";
    wait for 200 ns;
    
    I <= "100100000001";
    RegChk <= "1100";
    wait for 200 ns;
        
    I <= "110000000011";
    RegChk <= "1100";
    wait for 200 ns;
    
    I <= "110000000011";
    RegChk <= "0000";
    wait ;
    
end process;
end Behavioral;
