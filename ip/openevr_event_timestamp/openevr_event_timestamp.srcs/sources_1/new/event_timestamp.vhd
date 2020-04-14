----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 11.07.2019 08:34:11
-- Design Name:
-- Module Name: event_timestamp - Behavioral
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
Library UNIMACRO;
use UNIMACRO.vcomponents.all;


entity event_timestamp is
    Port ( event_code : in STD_LOGIC_VECTOR (7 downto 0);
           event_clk : in STD_LOGIC;
           prescaler_val : in std_logic_vector (15 downto 0);
           MAP14    : in std_logic;
           dbus_ena : in std_logic;
           prescaler : in std_logic;
            dbus : in STD_LOGIC_VECTOR (7 downto 0);
            reset : in STD_LOGIC;
            fifo_buffer_out : out STD_LOGIC_VECTOR(71 downto 0);
            wr_en_out    : out STD_LOGIC;
            configured_clk : out STD_LOGIC
           );
end event_timestamp;

architecture Behavioral of event_timestamp is

constant load_zero : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#70#, event_code'length));
constant load_one : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#71#, event_code'length));
constant event_counter_reset : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#7D#, event_code'length));
constant TS_event_counter : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#7C#, event_code'length));
constant code_eleven : std_logic_vector(event_code'range) := std_logic_vector( to_unsigned(16#B#, event_code'length));


signal timestamp_event_counter : std_logic_vector(31 downto 0) := (others => '0');
signal timestamp_latch : std_logic_vector(31 downto 0) := (others => '0');

signal seconds_shift_reg : std_logic_vector(31 downto 0) := (others => '0');
signal seconds_reg : std_logic_vector(31 downto 0) := (others => '0');
signal seconds_latch : std_logic_vector(31 downto 0) := (others => '0');

signal prescaler_out : std_logic := '0';
signal dbus_out : std_logic := '0';
signal prescaler_reg_out : std_logic := '0';

signal event_code_pip0 : STD_LOGIC_VECTOR (7 downto 0);
signal event_code_pip1 : STD_LOGIC_VECTOR (7 downto 0);




TYPE fifoRecord IS record
    seconds : std_logic_vector(31 downto 0);
    timestamp : std_logic_vector(31 downto 0);
    event : std_logic_vector(7 downto 0);
end record fifoRecord;

signal fifo_buffer : fifoRecord := (seconds => (others => '0'), timestamp => (others => '0'), event => (others =>'0'));
signal prescaler_reg_out_p_counter : std_logic_vector (15 downto 0) := (others => '0');

attribute keep : string;
attribute keep of seconds_shift_reg: signal is "true";
attribute keep of seconds_reg: signal is "true";
attribute keep of prescaler_out: signal is "true";
attribute keep of timestamp_event_counter: signal is "true";
attribute keep of prescaler: signal is "true";
attribute keep of fifo_buffer: signal is "true";


ATTRIBUTE MARK_DEBUG : string;

ATTRIBUTE MARK_DEBUG of seconds_shift_reg: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of seconds_reg: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of prescaler_out: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of timestamp_event_counter: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of prescaler: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of fifo_buffer: SIGNAL IS "TRUE";

signal ALMOSTEMPTY : std_logic;
signal ALMOSTFULL : std_logic;
signal DO : std_logic_vector(71 downto 0);
signal EMPTY : std_logic;
signal FULL : std_logic;
signal RDCOUNT : std_logic_vector(8 downto 0);
signal RDERR : std_logic;
signal WRCOUNT : std_logic_vector(8 downto 0);
signal WRERR : std_logic;
signal CLK : std_logic;
signal DI : std_logic_vector(71 downto 0);
signal RDEN : std_logic;
signal RST : std_logic;
signal WREN : std_logic;

signal buff_CE :std_logic;

begin

  fifo_buffer_out<= DI;
  wr_en_out <= WREN;
  configured_clk <= prescaler_out;

event_code_pipeline : process(prescaler_out)
begin
  if rising_edge(prescaler_out) then
    event_code_pip0 <= event_code;
    event_code_pip1 <= event_code_pip0;
  end if;

end process;


   BUFGCE_inst : BUFGCE
   port map (
      O => prescaler_reg_out,   -- 1-bit output: Clock output
      CE => buff_CE, -- 1-bit input: Clock enable input for I0
      I => event_clk    -- 1-bit input: Primary clock
   );

  FIFO_SYNC_MACRO_inst : FIFO_SYNC_MACRO
  generic map (
     DEVICE => "7SERIES",            -- Target Device: "VIRTEX5, "VIRTEX6", "7SERIES"
     ALMOST_FULL_OFFSET => X"0080",  -- Sets almost full threshold
     ALMOST_EMPTY_OFFSET => X"0080", -- Sets the almost empty threshold
     DATA_WIDTH => 72,   -- Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
     FIFO_SIZE => "36Kb")            -- Target BRAM, "18Kb" or "36Kb"
  port map (
     ALMOSTEMPTY => ALMOSTEMPTY,   -- 1-bit output almost empty
     ALMOSTFULL => ALMOSTFULL,     -- 1-bit output almost full
     DO => DO,                     -- Output data, width defined by DATA_WIDTH parameter
     EMPTY => EMPTY,               -- 1-bit output empty
     FULL => FULL,                 -- 1-bit output full
     RDCOUNT => RDCOUNT,           -- Output read count, width determined by FIFO depth
     RDERR => RDERR,               -- 1-bit output read error
     WRCOUNT => WRCOUNT,           -- Output write count, width determined by FIFO depth
     WRERR => WRERR,               -- 1-bit output write error
     CLK => CLK,                   -- 1-bit input clock
     DI => DI,                     -- Input data, width defined by DATA_WIDTH parameter
     RDEN => RDEN,                 -- 1-bit input read enable
     RST => RST,                   -- 1-bit input reset
     WREN => WREN                  -- 1-bit input write enable
  );
  -- End of FIFO_SYNC_MACRO_inst instantiation

  DI <= fifo_buffer.seconds & fifo_buffer.timestamp & fifo_buffer.event;
  CLK <= prescaler_out;
  RST <= reset;

fifo_en : process(prescaler_out)
begin
  if rising_edge(prescaler_out) then
    if event_code = code_eleven then
      WREN <= '1';
    else
      WREN <= '0';
    end if;
  end if;

end process;

prescaler_p : process(prescaler,dbus_out,prescaler_reg_out)
begin
    if prescaler = '1' then
        prescaler_out <= dbus_out;
    else
        prescaler_out <= prescaler_reg_out;
    end if;
end process;


prescaler_reg_out_p : process(event_clk,prescaler_reg_out)
begin

    if rising_edge (event_clk) then
        if (event_code = event_counter_reset) then
            prescaler_reg_out_p_counter <= (others => '0');
            buff_CE  <= '0';
        else
            if (prescaler_reg_out_p_counter = prescaler_val) then
                prescaler_reg_out_p_counter <= (others => '0');
                buff_CE <= '1';
            else
                prescaler_reg_out_p_counter <=  std_logic_vector(unsigned(prescaler_reg_out_p_counter) +1);
                buff_CE  <= '0';
            end if;
        end if;
    end if;

end process;

dbus_p : process(dbus_ena, dbus_out, event_clk)
begin

    if dbus_ena = '1' then
       if (dbus(4) = '1') then
           dbus_out <= '1';
       else
           dbus_out <= '0';
       end if;

    else
        if (event_code_pip1 = TS_event_counter) then
            dbus_out <= '1';
        else
            dbus_out <= '0';
        end if;
    end if;


end process;


seconds_shift_p : process (event_clk)
begin
    if rising_edge(event_clk) then
        if event_code_pip1 = load_zero then
            seconds_shift_reg <= seconds_shift_reg(30 downto 0) & '0';
        elsif event_code_pip1 = load_one then
                seconds_shift_reg <= seconds_shift_reg(30 downto 0) & '1';
        end if;

    end if;
end process;

seconds_load_p : process(prescaler_out)
begin
    if rising_edge (prescaler_out) then
        if event_code_pip1 = event_counter_reset then
            seconds_reg <= seconds_shift_reg;
        end if;
    end if;

end process;

seconds_latch_p : process(MAP14, seconds_reg, timestamp_event_counter)
begin
    if MAP14 = '1' then
        seconds_latch <= seconds_reg;
        timestamp_latch <= timestamp_event_counter;
    end if;

end process;

timestamp_event_cnt_p : process(event_clk) -- was prescaler_out, testing if event_clk fixess isues
begin
    if rising_edge (event_clk) then
        if event_code_pip1 = event_counter_reset then
            timestamp_event_counter <= (others => '0');
        else
            timestamp_event_counter <= std_logic_vector(unsigned(timestamp_event_counter) +1);
        end if;
    end if;
end process;

event_fifo_p : process(prescaler_out)
begin
    if rising_edge(prescaler_out) then
        fifo_buffer.seconds <= seconds_reg;
        fifo_buffer.timestamp <= timestamp_event_counter;
        fifo_buffer.event <= event_code;
    end if;
end process;


end Behavioral;
