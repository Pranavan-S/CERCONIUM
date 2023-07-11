----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 12:28:41 PM
-- Design Name: 
-- Module Name: TB_RegisterBank - Behavioral
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

entity TB_RegisterBank is
--  Port ( );
end TB_RegisterBank;

architecture Behavioral of TB_RegisterBank is
component RegisterBank
    Port ( EN : in STD_LOGIC_VECTOR (2 downto 0);
           Res: in STD_LOGIC;
           D_in : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           D_out0 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out1 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out2 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out3 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out4 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out5 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out6 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal D_in, D_out0 ,D_out1, D_out2, D_out3, D_out4, D_out5, D_out6, D_out7: std_logic_vector(3 downto 0);
signal EN:std_logic_vector(2 downto 0);
signal Clk,Res: std_logic; 

begin
UUT: RegisterBank
    port map(
        Clk =>Clk,
        Res => Res,
        EN => EN,
        D_in => D_in,
        D_out0 => D_out0,
        D_out1 => D_out1,
        D_out2 => D_out2,
        D_out3 => D_out3,
        D_out4 => D_out4,
        D_out5 => D_out5,
        D_out6 => D_out6,
        D_out7 => D_out7
        
    );
process
begin
    Clk <= '0';
    wait for 10 ns;
    Clk <= not Clk;
    wait for 10 ns;
end process;

process
begin
    Res <= '0';
    EN <= "000";
    D_in <= "1100";
    wait for 200 ns;
    EN <= "001";
    D_in <= "1001";
    wait for 200 ns;
    EN <= "101";
    D_in <= "1101";
    wait for 200 ns;
    
    Res <= '1';
    wait for 200 ns;
    D_in <= "0000";
    Res <= '0';
    wait;
end process;
end Behavioral;
