library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_std.all;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity test_data_gen is
  port (
    sys_clk     : in std_logic;
    data_out    : out std_logic_vector(31 downto 0);
    data_we     : out std_logic;
    reg_ctl     : in std_logic_vector(31 downto 0);
    count_ctl   : in std_logic_vector(31 downto 0);
    reg_status  : out std_logic_vector(31 downto 0);
    reset       : in std_logic;
    mrf_din     : in std_logic_vector (31 downto 0);
    mrf_wr_en   : in std_logic;
    mrf_wr_clk  : in std_logic;
    data_wr_clk : out std_logic
  );

end test_data_gen;



architecture arch of test_data_gen is

  type StateType is(idle, enabled, single_en, counting, counting_dis, single_dis);
  signal state, nextState : StateType;

  signal local_data_we, local_reset : std_logic := '0';
  signal bit_enabled : std_logic  := reg_ctl(0);
  signal bit_counter_en : std_logic := reg_ctl(1);
  signal bit_single_en : std_logic := reg_ctl(2);
  signal bit_reset : std_logic := reg_ctl(3);
  signal  bit_enable_test_data : std_logic := '0';


  signal local_counter : std_logic_vector (31 downto 0) := (others => '0');
  --signal zero_padding : std_logic_vector (21 downto 0) := (others => '0');

  signal local_status_counter : std_logic_vector(31 downto 0) := (others => '0');
  signal local_data_out : std_logic_vector(31 downto 0) := (others => '0');
  signal clk_select : std_logic := '0';




begin

 --    BUFGMUX_inst : BUFGMUX
 -- port map (
 --    O => data_wr_clk,   -- 1-bit output: Clock output
 --    I0 => mrf_wr_clk, -- 1-bit input: Clock input (S=0)
 --    I1 => sys_clk, -- 1-bit input: Clock input (S=1)
 --    S => clk_select    -- 1-bit input: Clock select
 -- );

 BUFGMUX_CTRL_inst : BUFGMUX_CTRL
port map (
   O => data_wr_clk,   -- 1-bit output: Clock output
   I0 => mrf_wr_clk, -- 1-bit input: Clock input (S=0)
   I1 => sys_clk, -- 1-bit input: Clock input (S=1)
   S => clk_select    -- 1-bit input: Clock select
);

  -- data_wr_clk <= mrf_wr_clk;

  bit_enabled <= reg_ctl(0);
  bit_counter_en <= reg_ctl(1);
  bit_single_en <= reg_ctl(2);
  bit_reset <= reg_ctl(3);
  bit_enable_test_data <= reg_ctl(4);
  reg_status <= local_status_counter;
  --data_we <= local_data_we;

  local_reset <= bit_reset or reset;
  clk_select <= bit_enable_test_data;


passthrugh_mux : process(bit_enable_test_data)
begin
    if bit_enable_test_data = '0' then -- if 0 then passthrough
        data_out <= mrf_din;
        data_we <= mrf_wr_en;
    else -- if 1 then set test data
        data_out <= local_data_out;
        data_we <= local_data_we;

    end if;

end process;



status_reg : process(sys_clk, local_reset)
begin
  if local_reset = '1' then
      local_status_counter <= (others => '0');
  elsif Rising_edge(sys_clk) then
    if local_data_we = '1' then
      local_status_counter <= std_logic_vector(unsigned(local_status_counter) +1);
    end if;
  end if;

end process;


statemachine : process(sys_clk, local_reset)
begin
  if local_reset = '1' then
      state <= idle;
  elsif Rising_edge(sys_clk) then
    state <= nextState;
  end if;
end process;

counter : process(sys_clk)
begin
  if Rising_edge(sys_clk) then
    if state = counting then
      if local_counter < count_ctl then
        local_counter <= std_logic_vector(unsigned(local_counter) +1);
      end if;
    else
      local_counter <= (others => '0');
    end if;

  end if;

end process;


comb_statemachine : process(state, bit_enabled, bit_counter_en, bit_single_en, local_counter)
begin
  nextState <= state;
  local_data_we <= '0';
  local_data_out <= local_counter;


  case state is
    when idle =>
      local_data_we <= '0';
      if bit_enabled = '1' then
        nextState <= enabled;
      end if;

    when enabled =>
      if bit_counter_en = '1' then
        nextState <= counting;
      elsif bit_single_en ='1' then
        nextState <= single_en;
      else
        nextState <= idle;
      end if;

    when single_en =>
        local_data_out <= count_ctl;
        local_data_we <= '1';
        nextState <= single_dis;

    when single_dis =>
        local_data_we <= '0';

        if bit_single_en = '0' then
            nextState <= idle;
        end if;


    when counting =>
      local_data_we <= '1';
      if local_counter = count_ctl then
        local_data_we <= '0';
        nextState <= counting_dis;
      end if;
  when counting_dis =>
     if bit_counter_en = '0' then
         nextState <= idle;
     end if;


  end case;
end process;



end architecture;
