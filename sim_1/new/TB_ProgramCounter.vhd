----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:10:53 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
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

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is
component ProgramCounter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal D,Q: std_logic_vector(2 downto 0);
signal Clk, Res: std_logic;

begin
    UUT: ProgramCounter
    port map(
        D => D,
        Q =>Q,
        Clk =>Clk,
        Res =>Res 
    );
process 
begin
    Clk <= '0';
    wait for 10 ns;
    Clk <= '1';
    wait for 10 ns;
end process;

process
begin
    Res <= '0';
    D <= "010";
    wait for 50 ns;
    

    D <= "110";
    wait for 100 ns;
    
        
    D <= "000";
    wait;
end process;    
end Behavioral;
