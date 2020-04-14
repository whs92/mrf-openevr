----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10.01.2020 08:46:58
-- Design Name:
-- Module Name: tbpackingMachine - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tbpackingMachine is
--  Port ( );
end tbpackingMachine;


architecture Behavioral of tbpackingMachine is

  component packingMachine
  port (
    fifo_buffer  : in  STD_LOGIC_VECTOR (71 downto 0);
    fifo_clk     : in  STD_LOGIC;
    wr_en_in     : in  STD_LOGIC;
    reset        : in  STD_LOGIC;
    wr_en_out    : out STD_LOGIC;
    fifo_clk_out : out STD_LOGIC;
    data_out     : out STD_LOGIC_VECTOR (31 downto 0)
  );
  end component packingMachine;

signal fifo_buffer  : STD_LOGIC_VECTOR (71 downto 0) := (others => '0');
signal fifo_clk     : STD_LOGIC;
signal wr_en_in     : STD_LOGIC := '0';
signal reset        : STD_LOGIC;
signal wr_en_out    : STD_LOGIC;
signal fifo_clk_out : STD_LOGIC;
signal data_out     : STD_LOGIC_VECTOR (31 downto 0);

signal stop_the_clock: boolean;
constant clock_period: time := 5 ns;

function slv_to_string ( a: std_logic_vector) return string is
    variable b : string (a'length-1 downto 1) := (others => NUL);
begin
        for i in a'length-1 downto 1 loop
        b(i) := std_logic'image(a((i-1)))(2);
        end loop;
    return b;
end function;

procedure assertSignals(sigToTest : in STD_LOGIC_VECTOR; answer : in STD_LOGIC_VECTOR) is
  begin

    assert sigToTest = answer report "Output wrong! from here" severity ERROR;
    if sigToTest /= answer then
      report "Output wrong! Expected:";
      -- try using this https://gist.github.com/mathieucaroff/3132c36ff21b63a72c8c0574998859ee
    end if;

  end procedure;


begin

  packingMachine_i : packingMachine
port map (
  fifo_buffer  => fifo_buffer,
  fifo_clk     => fifo_clk,
  wr_en_in     => wr_en_in,
  reset        => reset,
  wr_en_out    => wr_en_out,
  fifo_clk_out => fifo_clk_out,
  data_out     => data_out
);

stimulus: process
 begin

   reset <= '0';
   wait for 5 ns;
   reset <= '0';
   wait for 5 ns;
   fifo_buffer <= x"5e18617d004c673700";
   wait for 5 ns;

   fifo_buffer <= x"5e18617d004c67340b";
   wr_en_in <= '1';
   wait for 5 ns;
   assert data_out = x"5e18617d" report "Output wrong!" severity ERROR;

   fifo_buffer <= x"5e18617d004c673500";
   wr_en_in <= '0';
   wait for 5 ns;

   -- assert data_out = x"004c6735" report "Output wrong!" severity ERROR;
   assertSignals(data_out, x"004c6735");
  fifo_buffer <= x"5e18617d004c673600";

 -- want output as 5e18617d 004c6734 0b

 wait for 5 ns;
fifo_buffer <= x"5e187d03002f1a8d00";
wait for 5 ns;
fifo_buffer <= x"5e187d03002f1a8f00";
wait for 5 ns;
fifo_buffer <= x"5e187d03002f1a9100";
wait for 5 ns;
fifo_buffer <= x"5e187d03002f1a9300";



  wait for 100 ns;

  fifo_buffer <= x"5e18617d004c673500";
  wait for 5 ns;
 wr_en_in <= '1';
  wait for 5 ns;
 wr_en_in <= '0';


   wait for 1000 ns;
   stop_the_clock <= true;
   wait;
 end process;


clocking: process
begin
  while not stop_the_clock loop
    fifo_clk <= '0', '1' after clock_period / 2;
    wait for clock_period;
  end loop;
  wait;
end process;


end Behavioral;
