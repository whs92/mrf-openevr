----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.05.2019 12:03:53
-- Design Name:
-- Module Name: data_stream_manager_M0_tb - Behavioral
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
use IEEE . NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_stream_manager_M0_tb is
--  Port ( );
end data_stream_manager_M0_tb;

architecture Behavioral of data_stream_manager_M0_tb is

component data_stream_manager_v1_0_M00_AXIS
generic (
  C_M_AXIS_TDATA_WIDTH : integer := 32;
  C_M_START_COUNT      : integer := 32
);
port (
    data_in         : in std_logic_vector (31 downto 0);
    fifo_rd_count   : in std_logic_vector (9 downto 0);
    fifo_rd_enable  : out std_logic;
    packet_size     : in std_logic_vector (31 downto 0);
    descriptors_ready : in std_logic;
    last_word_send    : out std_logic_vector (31 downto 0);
    intrThreshold       : in std_logic_vector(31 downto 0);
    intr                : out std_logic;
    reset               : in std_logic;
  M_AXIS_ACLK       : in  std_logic;
  M_AXIS_ARESETN    : in  std_logic;
  M_AXIS_TVALID     : out std_logic;
  M_AXIS_TDATA      : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
  M_AXIS_TSTRB      : out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
  M_AXIS_TLAST      : out std_logic;
  M_AXIS_TREADY     : in  std_logic
);
end component data_stream_manager_v1_0_M00_AXIS;


signal data_in           : std_logic_vector (31 downto 0) := (others => '0');
signal fifo_rd_count     : std_logic_vector (9 downto 0);
signal fifo_rd_enable    : std_logic;
signal packet_size       : std_logic_vector (31 downto 0);
signal descriptors_ready : std_logic;
signal M_AXIS_ACLK       : std_logic;
signal M_AXIS_ARESETN    : std_logic;
signal M_AXIS_TVALID     : std_logic;
signal M_AXIS_TDATA      : std_logic_vector(32-1 downto 0);
signal M_AXIS_TSTRB      : std_logic_vector((32/8)-1 downto 0);
signal M_AXIS_TLAST      : std_logic;
signal M_AXIS_TREADY     : std_logic;
signal last_word_send    : std_logic_vector (31 downto 0);
signal intrThreshold     : std_logic_vector(31 downto 0) := x"0000000A";
signal intr              : std_logic;
signal reset             : std_logic := '0';

constant clock_period: time := 10 ns;
signal stop_the_clock: boolean;

begin


data_stream_manager_v1_0_M00_AXIS_i : data_stream_manager_v1_0_M00_AXIS
generic map (
  C_M_AXIS_TDATA_WIDTH => 32,
  C_M_START_COUNT      => 32
)
port map (
  data_in           => data_in,
  fifo_rd_count     => fifo_rd_count,
  fifo_rd_enable    => fifo_rd_enable,
  packet_size       => packet_size,
  descriptors_ready => descriptors_ready,
  last_word_send    => last_word_send,
  intrThreshold     => intrThreshold,
  intr              => intr,
  reset             =>  reset,
  M_AXIS_ACLK       => M_AXIS_ACLK,
  M_AXIS_ARESETN    => M_AXIS_ARESETN,
  M_AXIS_TVALID     => M_AXIS_TVALID,
  M_AXIS_TDATA      => M_AXIS_TDATA,
  M_AXIS_TSTRB      => M_AXIS_TSTRB,
  M_AXIS_TLAST      => M_AXIS_TLAST,
  M_AXIS_TREADY     => M_AXIS_TREADY
);


fakefifo : process(M_AXIS_ACLK)
begin

if rising_edge(M_AXIS_ACLK) then
    if fifo_rd_enable = '1' then
        data_in <= std_logic_vector(unsigned(data_in) + 1);
    end if;

end if;
end process;


  stimulus: process
   begin

     -- Put initialisation code here

     packet_size <= STD_LOGIC_VECTOR(to_unsigned(25 , 32));
     fifo_rd_count<= STD_LOGIC_VECTOR(to_unsigned(30 , 10));
--     data_in <=  STD_LOGIC_VECTOR(to_unsigned(999 , 32));
     descriptors_ready <= '0';
   M_AXIS_TREADY <= '1';

     M_AXIS_ARESETN <= '0';
      wait for 5 ns;
     M_AXIS_ARESETN <= '1';
       wait for 500 ns;

       descriptors_ready <= '1';

       wait for 200 ns;
          M_AXIS_TREADY <= '0';
       wait for 100 ns;
          M_AXIS_TREADY <= '1';
       wait for 70 ns;
             M_AXIS_TREADY <= '0';
       wait for 70 ns;
                   M_AXIS_TREADY <= '1';

--     count_ctl <= x"00000033";

--     reset <= '1';
--     wait for 5 ns;
--     reset <= '0';
--     wait for 5 ns;
--     reg_ctl <= (0 => '1', 1=> '1', others => '0');
--     reg_ctl(31 downto 22) <= "0011000100";
--     wait for 500 ns;



     wait for 10000 ns;




     -- Put test bench stimulus code here

     stop_the_clock <= true;
     wait;
   end process;


   clocking: process
   begin
     while not stop_the_clock loop
       M_AXIS_ACLK <= '0', '1' after clock_period / 2;
       wait for clock_period;
     end loop;
     wait;
   end process;

end Behavioral;
