--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
--Date        : Mon Apr  8 16:27:23 2019
--Host        : OptiPlex-5050 running 64-bit Ubuntu 18.04.2 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    gpout_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    
        PL_CLK       : in std_logic;
    PL_LED1      : out std_logic;  -- Carrier D6
    PL_LED2      : out std_logic;  -- Carrier D7
    PL_LED3      : out std_logic;  -- Carrier D8
    PL_LED4      : out std_logic;  -- Carrier D9

    PL_PB1       : in std_logic;   -- JX1 pin 19,  Zynq G2, Carrier SW1 N
    PL_PB2       : in std_logic;   -- JX2 pin 100, Zynq T16, Carrier SW5 S
    PL_PB3       : in std_logic;   -- JX2 pin 95,  Zynq AB22, Carrier SW3, E
    PL_PB4       : in std_logic;   -- JX2 pin 94,  Zynq AB18, Carrier SW2, W
    PL_PB5       : in std_logic;   -- JX2 pin 96,  Zynq AB19, Carrier SW4, C

    BANK13_LVDS_8_P : out std_logic;
    BANK13_LVDS_8_N : out std_logic;
    
    MGTREFCLK1_P : in std_logic;   -- JX3 pin 2,   Zynq U5
    MGTREFCLK1_N : in std_logic;   -- JX3 pin 3,   Zynq V5

    MGTTX2_P     : out std_logic;  -- JX3 pin 25,  Zynq AA5
    MGTTX2_N     : out std_logic;  -- JX3 pin 27,  Zynq AB5
    MGTRX2_P     : in std_logic;   -- JX3 pin 20,  Zynq AA9
    MGTRX2_N     : in std_logic    -- JX3 pin 22,  Zynq AB9

    
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is

  component design_1 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    fifo_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    gpout_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_1;
  
  component zynq_top
  port (
    PL_CLK          : in  std_logic;
    PL_LED1         : out std_logic;
    PL_LED2         : out std_logic;
    PL_LED3         : out std_logic;
    PL_LED4         : out std_logic;
    PL_PB1          : in  std_logic;
    PL_PB2          : in  std_logic;
    PL_PB3          : in  std_logic;
    PL_PB4          : in  std_logic;
    PL_PB5          : in  std_logic;
    BANK13_LVDS_8_P : out std_logic;
    BANK13_LVDS_8_N : out std_logic;
    MGTREFCLK1_P    : in  std_logic;
    MGTREFCLK1_N    : in  std_logic;
    MGTTX2_P        : out std_logic;
    MGTTX2_N        : out std_logic;
    MGTRX2_P        : in  std_logic;
    MGTRX2_N        : in  std_logic;    -- JX3 pin 22,  Zynq AB9
    event_rxd       : out std_logic_vector(7 downto 0);  -- Received event code
    event_clk_out   : out std_logic -- Event clock output, delay compensated
  );
  end component zynq_top;
  
component event_timestamp
  port (
    event_code      : in  STD_LOGIC_VECTOR (7 downto 0);
    event_clk       : in  STD_LOGIC;
    prescaler_val   : in  std_logic_vector (15 downto 0);
    MAP14           : in  std_logic;
    dbus_ena        : in  std_logic;
    prescaler       : in  std_logic;
    dbus            : in  STD_LOGIC_VECTOR (7 downto 0);
    reset           : in  STD_LOGIC;
    fifo_buffer_out : out STD_LOGIC_VECTOR(71 downto 0);
    wr_en_out       : out STD_LOGIC;
    configured_clk : out STD_LOGIC
  );
  end component event_timestamp;

  
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

  signal fifo_buffer : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal wr_en_in   : std_logic;
  signal wr_en_out  : std_logic;
  signal configured_clk : std_logic;
  signal fifo_clk_out   : std_logic;
  signal data_out       : STD_LOGIC_VECTOR ( 31 downto 0 );
  
  
  signal fifo_din : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal fifo_wr_clk : STD_LOGIC;
  signal fifo_wr_en : STD_LOGIC;
  signal event_rxd       :  std_logic_vector(7 downto 0);  -- Received event code
  signal event_clk_out   : std_logic; -- Event clock output, delay compensated
  signal mrf_reset : std_logic;
  
ATTRIBUTE MARK_DEBUG : string;
  
ATTRIBUTE MARK_DEBUG of event_clk_out: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of fifo_wr_en: SIGNAL IS "TRUE";
ATTRIBUTE MARK_DEBUG of event_rxd: SIGNAL IS "TRUE";


begin


    mrf_reset <= not DDR_reset_n;

--process(event_clk_out)
--begin

--    fifo_wr_clk <= event_clk_out;


-- if rising_edge(event_clk_out) then
    
--    fifo_din <= std_logic_vector(resize(unsigned(event_rxd), 32));
    
----    fifo_wr_clk <= event_clk_out;
 
--    if event_rxd /= x"00" then -- got real event
--         fifo_wr_en <= '1';
--    else
--          fifo_wr_en <= '0';
--    end if;
 
-- end if;


--end process;
fifo_wr_clk <= fifo_clk_out;
fifo_din <= data_out;
fifo_wr_en <= wr_en_out;

packingMachine_i : packingMachine
port map (
  fifo_buffer  => fifo_buffer,
  fifo_clk     => configured_clk,
  wr_en_in     => wr_en_in,
  reset        => '0',
  wr_en_out    => wr_en_out,
  fifo_clk_out => fifo_clk_out,
  data_out     => data_out
);

event_timestamp_i : event_timestamp
port map (
  event_code    => event_rxd,
  event_clk     => event_clk_out,
  prescaler_val => "0000000000000000",
  MAP14         => '1',
  dbus_ena      => '0',
  prescaler     => '0',
  dbus          => "00000000",
  reset         => mrf_reset,
  fifo_buffer_out   => fifo_buffer,
  wr_en_out         => wr_en_in, 
  configured_clk    =>configured_clk
);


design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      gpout_tri_o(3 downto 0) => gpout_tri_o(3 downto 0),
      fifo_din(31 downto 0) => fifo_din(31 downto 0),
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_en => fifo_wr_en
    );
    
    
    zynq_top_i : zynq_top
    port map (
      PL_CLK          => PL_CLK,
      PL_LED1         => PL_LED1,
      PL_LED2         => PL_LED2,
      PL_LED3         => PL_LED3,
      PL_LED4         => PL_LED4,
      PL_PB1          => PL_PB1,
      PL_PB2          => PL_PB2,
      PL_PB3          => PL_PB3,
      PL_PB4          => PL_PB4,
      PL_PB5          => PL_PB5,
      BANK13_LVDS_8_P => BANK13_LVDS_8_P,
      BANK13_LVDS_8_N => BANK13_LVDS_8_N,
      MGTREFCLK1_P    => MGTREFCLK1_P,
      MGTREFCLK1_N    => MGTREFCLK1_N,
      MGTTX2_P        => MGTTX2_P,
      MGTTX2_N        => MGTTX2_N,
      MGTRX2_P        => MGTRX2_P,
      MGTRX2_N        => MGTRX2_N,
      event_rxd => event_rxd,
      event_clk_out => event_clk_out
      
    );

    
end STRUCTURE;

