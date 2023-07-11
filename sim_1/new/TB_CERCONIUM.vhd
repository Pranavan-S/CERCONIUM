----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 12:19:00 AM
-- Design Name: 
-- Module Name: TB_CERCONIUM - Behavioral
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

entity TB_CERCONIUM is
--  Port ( );
end TB_CERCONIUM;

architecture Behavioral of TB_CERCONIUM is

component CERCONIUM
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R0: out std_logic_vector(3 downto 0);
           R1: out std_logic_vector(3 downto 0);
           R2: out std_logic_vector(3 downto 0);
           R3: out std_logic_vector(3 downto 0);
           R4: out std_logic_vector(3 downto 0);
           R5: out std_logic_vector(3 downto 0);
           R6: out std_logic_vector(3 downto 0);
           R7: out std_logic_vector(3 downto 0);
           PC: out std_logic_vector(2 downto 0);
           Anode: out std_logic_vector(3 downto 0);
           Seg_Comb : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Reset: std_logic:= '1';
signal Clk: std_logic:= '0';
signal OverFlow, Zero: std_logic;
signal R0,R1,R2,R3,R4,R5,R6,R7: std_logic_vector(3 downto 0);
signal PC: std_logic_vector(2 downto 0);
begin
UUT: CERCONIUM
    port map(
        Reset => Reset,
        Clk => Clk,
        OverFlow => OverFlow,
        Zero => Zero,
        R0 => R0,
        R1 => R1,        
        R2 => R2,        
        R3 => R3,        
        R4 => R4,        
        R5 => R5,        
        R6 => R6,        
        R7 => R7,
        PC => PC
    );
process
begin
    Clk <= not Clk;
    wait for 5 ns;
end process;

process
begin
    wait for 191 ns;
    Reset <= '0';
    Wait;
end process;

end Behavioral;
