----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 11.07.2019 14:26:01
-- Design Name:
-- Module Name: tbevent_timestamp - Behavioral
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

entity tbevent_timestamp is
--  Port ( );
end tbevent_timestamp;



architecture Behavioral of tbevent_timestamp is

component event_timestamp
port (
  event_code : in  STD_LOGIC_VECTOR (7 downto 0);
  event_clk  : in  STD_LOGIC;
   MAP14    : in std_logic;
  dbus_ena : in std_logic;
  prescaler : in std_logic ;
 prescaler_val : in std_logic_vector (15 downto 0);
 dbus : in STD_LOGIC_VECTOR (7 downto 0);
 reset : in STD_LOGIC

);
end component event_timestamp;


signal dbus : STD_LOGIC_VECTOR (7 downto 0)  := "00000000";
signal event_code : STD_LOGIC_VECTOR (7 downto 0);
signal event_clk  : STD_LOGIC;
signal prescaler_val : std_logic_vector(15 downto 0) := std_logic_vector( to_unsigned(16#07#, 16));
signal MAP14 : std_logic := '1';
signal dbus_ena : std_logic := '1';
signal prescaler : std_logic := '1';
signal reset : std_logic := '0';

constant clock_period: time := 10 ns;
signal stop_the_clock: boolean;

constant load_zero : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#70#, event_code'length));
constant load_one : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#71#, event_code'length));
constant event_counter_reset : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#7D#, event_code'length));
constant TS_event_counter : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#7C#, event_code'length));
constant code_eleven : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#B#, event_code'length));

begin

event_timestamp_i : event_timestamp
port map (
  event_code => event_code,
  event_clk  => event_clk,
  prescaler_val => prescaler_val,
  MAP14 => MAP14,
  dbus_ena => dbus_ena,
  prescaler =>prescaler,
  dbus => dbus,
  reset =>reset

);

  stimulus: process
   begin

     dbus_ena  <= '1'; -- if '1', use dbus bit 4 as clk
     prescaler <= '1'; -- if '1' disable prescaler

     -- Put initialisation code here
     event_code <= x"00";
     wait for 5 ns;
    event_code <= load_one;
     wait for 5 ns;
    event_code <= load_one;
    wait for 5 ns;
   event_code <= load_zero;
    wait for 5 ns;
  event_code <= event_counter_reset;
    wait for 5 ns;
      event_code <= load_one;
      wait for 5 ns;
      event_code <= load_zero;
      wait for 5 ns;
        event_code <= load_one;
        

     wait for 1000 ns;
     stop_the_clock <= true;
     wait;
   end process;


   dbus_bit4: process
   begin
     while not stop_the_clock loop
       dbus <= "00000000", "00010000" after clock_period / 2;
       wait for clock_period;
     end loop;
     wait;
   end process;

   clocking: process
   begin
     while not stop_the_clock loop
       event_clk <= '0', '1' after clock_period / 2;
       wait for clock_period;
     end loop;
     wait;
   end process;



end Behavioral;
