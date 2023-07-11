----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 05:29:38 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( EN : in STD_LOGIC_VECTOR (2 downto 0);
           D_in : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Res: in STD_LOGIC;
           D_out0 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out1 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out2 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out3 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out4 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out5 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out6 : out STD_LOGIC_VECTOR (3 downto 0);
           D_out7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end RegisterBank;

architecture Behavioral of RegisterBank is
component Reg
    Port ( En : in STD_LOGIC;
           Res: in STD_LOGIC;
           Clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           En: in std_logic;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal EnableBus: std_logic_vector(7 downto 0);

begin
Decoder_Enable: Decoder_3_to_8
    port map(
        En => '1',
        I => EN,
        Y => EnableBus
    );
R0: Reg
    port map(
        Res => Res,
        En => EnableBus(0),
        Clk => Clk,
        D => "0000",
        Q => D_out0
    );
    
R1: Reg
    port map(
        Res => Res,
        En => EnableBus(1),
        Clk => Clk,
        D => D_in,
         Q => D_out1
    );

R2: Reg
    port map(
        Res => Res,
        En => EnableBus(2),
        Clk => Clk,
        D => D_in ,
        Q => D_out2
    );

R3: Reg
    port map(
        Res => Res,
        En => EnableBus(3),
        Clk => Clk,
        D => D_in,
        Q => D_out3
    );

R4: Reg
    port map(
        Res => Res,
        En => EnableBus(4),
        Clk => Clk,
        D => D_in,
        Q => D_out4
    );

R5: Reg
    port map(
        Res => Res,
        En => EnableBus(5),
        Clk => Clk,
        D => D_in,
        Q => D_out5
    );

R6: Reg
    port map(
        Res => Res,
        En => EnableBus(6),
        Clk => Clk,
        D => D_in,
        Q => D_out6 
    );

R7: Reg
    port map(
        Res => Res,
        En => EnableBus(7),
        Clk => Clk,
        D => D_in,
        Q => D_out7
    );


end Behavioral;
