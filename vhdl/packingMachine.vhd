----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10.01.2020 08:25:44
-- Design Name:
-- Module Name: packingMachine - Behavioral
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


-- We take in a 72 bit vector and break it down into three 32bit packets to be supported by AXI Stream
-- Not the most efficient but it will work... note that this will not work if we have events in within 3 cycles of each other
-- need to replace this with pulling data out of a fifo

entity packingMachine is
    Port ( fifo_buffer : in STD_LOGIC_VECTOR (71 downto 0);
          fifo_clk  :  in STD_LOGIC;
           wr_en_in : in STD_LOGIC;
           reset    : in STD_LOGIC;
           wr_en_out : out STD_LOGIC;
           fifo_clk_out : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end packingMachine;

architecture Behavioral of packingMachine is

  type state_t is (idle, first, second, third);
  signal state : state_t := idle;
  signal nextState : state_t := idle;

  signal inDataBuff : STD_LOGIC_VECTOR (71 downto 0) := (others => '0');

begin

  fifo_clk_out <= fifo_clk;

stateMachineClk : process(fifo_clk, reset)
begin
  if reset = '1' then
    state <= idle;
  elsif rising_edge(fifo_clk) then
    state <= nextState;
  end if;
end process;

capture_databuff : process(fifo_clk)
begin
  if rising_edge(fifo_clk) then
    if wr_en_in = '1' then
      inDataBuff <= fifo_buffer;
    end if;
  end if;

end process;

stateMachineComb : process(wr_en_in, state)
begin
  data_out <= (others => '0');
  wr_en_out <= '0';
   nextState <= state;


  case state is
    when idle =>
      if wr_en_in = '1' then
        nextState <= first;
      else
        nextState <= idle;
      end if;
      wr_en_out <= '0';


    -- we get data in as   DI <= fifo_buffer.seconds & fifo_buffer.timestamp & fifo_buffer.event;
    when first =>
      nextState <= second;
      data_out <= inDataBuff(71 downto 40);
      wr_en_out <= '1';

    when second =>
      nextState <= third;
      data_out <= inDataBuff(39 downto 8);
      wr_en_out <= '1';

    when third =>
      nextState <= idle;
      data_out <= "000000000000000000000000" & inDataBuff(7 downto 0);
      wr_en_out <= '1';

  end case;



end process;



end Behavioral;
