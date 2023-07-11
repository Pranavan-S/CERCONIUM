----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:29:19 PM
-- Design Name: 
-- Module Name: CERCONIUM - Behavioral
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

entity CERCONIUM is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7: out std_logic_vector(3 downto 0);
--           R0: out std_logic_vector(3 downto 0);
--           R2: out std_logic_vector(3 downto 0);
--           R3: out std_logic_vector(3 downto 0);
--           R4: out std_logic_vector(3 downto 0);
--           R5: out std_logic_vector(3 downto 0);
--           R6: out std_logic_vector(3 downto 0);
--           R1: out std_logic_vector(3 downto 0);
--           PC: out std_logic_vector(2 downto 0);
           Anode: out std_logic_vector(3 downto 0);
           Seg_Comb : out STD_LOGIC_VECTOR (6 downto 0));
end CERCONIUM;

architecture Behavioral of CERCONIUM is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

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

component RegisterBank
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
end component;

component MUX_2W_4b
    Port ( En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8W_4b
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
end component;

component RCA_4
    Port ( 
           A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           C_in : in STD_LOGIC;
           S: out STD_LOGIC_VECTOR(3 DOWNTO 0);
           OverFlow : out STD_LOGIC;
           Zero: out STD_LOGIC);
end component;

component MUX_2W_3b
    Port ( En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));   
end component;

component ProgramCounter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component RCA_3
    Port ( A: in STD_LOGIC_VECTOR(2 DOWNTO 0);
           S: out STD_LOGIC_VECTOR(2 DOWNTO 0);
           OverFlow : out STD_LOGIC);
end component;

component ProgramRom
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Slowed_Clk, Jump_Flag, Load_Select, Add_Sub_Sel: std_logic;
signal PC_D: std_logic_vector(2 downto 0):="000";
signal PC_Q, Next_Add, Next_Jump_Add, Register_Enable, Reg_Sel_A, Reg_Sel_B: std_logic_vector(2 downto 0);
signal Immediate_Value, AU_Value, Reg_A, Reg_B, Reg_in: std_logic_vector(3 downto 0);
signal Reg0_out, Reg1_out, Reg2_out, Reg3_out, Reg4_out, Reg5_out, Reg6_out, Reg7_out : std_logic_vector(3 downto 0);
signal I_Set: std_logic_vector(11 downto 0);



begin

Slow_Clk_0: Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Slowed_Clk
    );
Program_Counter: ProgramCounter
    port map(
        D => PC_D, 
        Clk => Slowed_Clk,
        Res => Reset,
        Q => PC_Q
    );
PC_In_Selecter: MUX_2W_3b
    port map(
        En => '1',
        Sel => Jump_Flag,
        I0 => Next_Add,
        I1 => Next_Jump_Add,
        Y =>PC_D
    );
PC_Incremeter: RCA_3
    port map(
        A => PC_Q,
        S => Next_Add
    );
Program_Rom: ProgramRom
    port map(
        A => PC_Q,
        I => I_Set
    );
Instruction_Decoder: InstructionDecoder
    port map(
        I => I_Set,
        RegChk => Reg_B,
        A_S_Sel => Add_Sub_Sel,
        LoadSel => Load_Select, 
        JumpFlag => Jump_Flag,       
        JumpAdd => Next_Jump_Add,
        Imm_Val => Immediate_value,
        RegSelA => Reg_Sel_A,
        RegSelB => Reg_Sel_B,
        RegEn => Register_Enable
    );
Register_Bank: RegisterBank
    port map(
        EN => Register_Enable,
        D_in => Reg_in,
        Clk => Slowed_Clk,
        Res => Reset,
        D_out0 => Reg0_out,
        D_out1 => Reg1_out,
        D_out2 => Reg2_out,
        D_out3 => Reg3_out,
        D_out4 => Reg4_out,
        D_out5 => Reg5_out,
        D_out6 => Reg6_out,
        D_out7 => Reg7_out        
    );
Reg_in_Selecter: MUX_2W_4b
    port map(
        En => '1',
        Sel => Load_Select,
        I0 => AU_Value,
        I1 => Immediate_Value,
        Y => Reg_in
    );
Reg_A_Selecter: MUX_8W_4b
    port map(
        En => '1',
        Sel => Reg_Sel_A,
        Y => Reg_A,
        I0 => Reg0_out,
        I1 => Reg1_out,
        I2 => Reg2_out,
        I3 => Reg3_out,
        I4 => Reg4_out,
        I5 => Reg5_out,
        I6 => Reg6_out,
        I7 => Reg7_out
    );
    
Reg_B_Selecter: MUX_8W_4b
    port map(
        En => '1',
        Sel => Reg_Sel_B,
        Y => Reg_B,
        I0 => Reg0_out,
        I1 => Reg1_out,
        I2 => Reg2_out,
        I3 => Reg3_out,
        I4 => Reg4_out,
        I5 => Reg5_out,
        I6 => Reg6_out,
        I7 => Reg7_out
    );
Adder_Unit: RCA_4
    port map(
        A => Reg_A,
        B => Reg_B,
        C_in => Add_Sub_Sel,
        S => AU_Value,
        OverFlow => OverFlow,
        Zero =>Zero
    );
    
Segment_Display_Comb: LUT_16_7
    port map(
    address => Reg7_out,
    data => Seg_Comb
    );
R7 <= Reg7_out;
--R0 <= Reg0_out;
--R2 <= Reg2_out;
--R3 <= Reg3_out;
--R4 <= Reg4_out;
--R5 <= Reg5_out;
--R6 <= Reg6_out;
--R7 <= Reg7_out;
--PC <= PC_D;
Anode <= "1110";
end Behavioral;
