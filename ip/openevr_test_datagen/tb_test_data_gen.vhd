library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity tb_test_data_gen is

end tb_test_data_gen;



architecture arch of tb_test_data_gen is

component test_data_gen
port (
  sys_clk    : in  std_logic;
  data_out   : out std_logic_vector(31 downto 0);
  data_we    : out std_logic;
  reg_ctl    : in  std_logic_vector(31 downto 0);
  count_ctl   : in std_logic_vector(31 downto 0);
  reg_status : out std_logic_vector(31 downto 0);
  reset      : in  std_logic
);
end component test_data_gen;


signal sys_clk    : std_logic;
signal data_out   : std_logic_vector(31 downto 0);
signal data_we    : std_logic;
signal reg_ctl    : std_logic_vector(31 downto 0);
signal reg_status : std_logic_vector(31 downto 0);
signal reset      : std_logic;
signal count_ctl : std_logic_vector(31 downto 0);


constant clock_period: time := 10 ns;
signal stop_the_clock: boolean;


begin

  test_data_gen_i : test_data_gen
  port map (
    sys_clk    => sys_clk,
    data_out   => data_out,
    data_we    => data_we,
    reg_ctl    => reg_ctl,
    reg_status => reg_status,
    reset      => reset,
    count_ctl  => count_ctl
  );



  stimulus: process
   begin

     -- Put initialisation code here
     count_ctl <= x"00000033";

     reset <= '1';
     wait for 5 ns;
     reset <= '0';
     wait for 5 ns;
     reg_ctl <= (0 => '1', 1=> '1', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";
     wait for 500 ns;
     reg_ctl(0) <= '0';
     reg_ctl(1) <= '0';
     wait for 1000 ns;
     reg_ctl <= (0 => '1', 1=> '1', 3 => '1', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";
     wait for 10 ns;
     reg_ctl <= (0 => '1', 1=> '1', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";
     wait for 1000 ns;
     reg_ctl <= (0 => '1', 1=> '0', 2=>'1', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";


     wait for 1000 ns;
     reg_ctl <= (0 => '1', 1=> '0', 2=>'0', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";
     wait for 1000 ns;
     reg_ctl <= (0 => '1', 1=> '0', 2=>'1', others => '0');
     reg_ctl(31 downto 22) <= "0011000100";

    wait for 1000 ns;
    reg_ctl <= (0 => '1', 1=> '0', 2=>'0', others => '0');
    reg_ctl(31 downto 22) <= "0011000100";
    wait for 1000 ns;
    reg_ctl <= (0 => '1', 1=> '0', 2=>'1', others => '0');
    reg_ctl(31 downto 22) <= "0011000100";

    wait for 1000 ns;
    reg_ctl <= (0 => '1', 1=> '0', 2=>'0', others => '0');
    reg_ctl(31 downto 22) <= "0011000100";
    wait for 1000 ns;
    reg_ctl <= (0 => '1', 1=> '0', 2=>'1', others => '0');
    reg_ctl(31 downto 22) <= "0011000100";

     wait for 10000 ns;




     -- Put test bench stimulus code here

     stop_the_clock <= true;
     wait;
   end process;

   clocking: process
   begin
     while not stop_the_clock loop
       sys_clk <= '0', '1' after clock_period / 2;
       wait for clock_period;
     end loop;
     wait;
   end process;



end architecture;
