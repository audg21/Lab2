----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2026 07:32:01 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end component sevenseg_decoder;

signal w_Hex : std_logic_vector (3 downto 0) :=(others => '0');

signal w_seg_n : std_logic_vector (6 downto 0) :=(others => '0');
begin
 sevenseg_decoder_inst : sevenseg_decoder
        port map (
            i_Hex => w_Hex,
            o_seg_n => w_seg_n
            );
test_process : process 
	begin
        -- Octal test cases based on full adder truth table
        -- https://usafa-ece.github.io/ece281-book/ICE/ICE3.html#full-adder-truth
        w_Hex <= x"0"; wait for 10 ns;
            assert w_seg_n = "1000000" report "Error on input x0" severity failure;
        w_Hex <= x"1"; wait for 10 ns;
            assert w_seg_n = "1111001" report "Error on input x1" severity failure;
        w_Hex <= x"2"; wait for 10 ns;
            assert w_seg_n = "0100100" report "Error on input x2" severity failure;
        w_Hex <= x"3"; wait for 10 ns;
            assert w_seg_n = "0110000" report "Error on input x3" severity failure;
        w_Hex <= x"4"; wait for 10 ns;
            assert w_seg_n = "0011001" report "Error on input x4" severity failure;
        w_Hex <= x"5"; wait for 10 ns;
            assert w_seg_n = "0010010" report "Error on input x5" severity failure;
        w_Hex <= x"6"; wait for 10 ns;
            assert w_seg_n = "0000010" report "Error on input x6" severity failure;
        w_Hex <= x"7"; wait for 10 ns;
            assert w_seg_n = "1111000" report "Error on input x7" severity failure;       
        w_Hex <= x"8"; wait for 10 ns;
            assert w_seg_n = "0000000" report "Error on input x8" severity failure;
        w_Hex <= x"9"; wait for 10 ns;
            assert w_seg_n = "0011000" report "Error on input x9" severity failure;
        w_Hex <= x"A"; wait for 10 ns;
            assert w_seg_n = "0001000" report "Error on input xA" severity failure;
        w_Hex <= x"B"; wait for 10 ns;
            assert w_seg_n = "1100000" report "Error on input xB" severity failure;
        w_Hex <= x"C"; wait for 10 ns;
            assert w_seg_n = "0100111" report "Error on input xC" severity failure;
        w_Hex <= x"D"; wait for 10 ns;
            assert w_seg_n = "0100001" report "Error on input xD" severity failure; 
        w_Hex <= x"E"; wait for 10 ns;
            assert w_seg_n = "0000110" report "Error on input xE" severity failure;
        w_Hex <= x"F"; wait for 10 ns;
            assert w_seg_n = "0001110" report "Error on input xF" severity failure;
                                 
		wait; -- wait forever
		
	end process;	


end Behavioral;
