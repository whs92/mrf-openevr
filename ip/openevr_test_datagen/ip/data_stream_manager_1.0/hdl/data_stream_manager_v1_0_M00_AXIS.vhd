library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_stream_manager_v1_0_M00_AXIS is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		-- Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		C_M_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
            data_in         : in std_logic_vector (31 downto 0);
            fifo_rd_count   : in std_logic_vector (9 downto 0);
            fifo_rd_enable  : out std_logic;
            packet_size     : in std_logic_vector (31 downto 0);
            descriptors_ready : in std_logic;
            last_word_send    : out std_logic_vector (31 downto 0);
            intrThreshold       : in std_logic_vector(31 downto 0);
            intr                : out std_logic;
            reset               : in std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK	: in std_logic;
		--
		M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted.
		M_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY	: in std_logic
	);
end data_stream_manager_v1_0_M00_AXIS;

architecture implementation of data_stream_manager_v1_0_M00_AXIS is

signal local_packet_counter : std_logic_vector(31 downto 0);

signal resetCycleCount : std_logic_vector(5 downto 0) := "000000";
signal fifoEmptyCycleCount : std_logic_vector(2 downto 0) := "000";


attribute keep : string;
attribute keep of resetCycleCount : signal is "true";
attribute keep of local_packet_counter : signal is "true";


signal internalEn : std_logic := '0';
signal internalFifoEmpty : std_logic := '0';
signal local_tvalid : std_logic := '0';
signal local_tlast : std_logic := '0';

signal fifoSentEmpty : boolean := FALSE;

signal intr0, intr1, intr2 : std_logic  := '0';

signal adc_reg : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

signal stage1, stage2, stage3 : std_logic := '0';


  type StateType is(idle, enabled, fifo_rd_en, waitfortready, counting, finish_last, wait_for_reset);
  signal state, nextState : StateType;

begin
	-- I/O Connections assignments

M_AXIS_TDATA    <= adc_reg;
M_AXIS_TLAST    <= local_tlast;
M_AXIS_TSTRB    <= (others => '1');
M_AXIS_TVALID <= local_tvalid;

--tvalid_delay : process(M_AXIS_ACLK)
--begin
--    if rising_edge(M_AXIS_ACLK) then
--        M_AXIS_TVALID <= local_tvalid;
--    end if;
--end process tvalid_delay;



count_reset_cycles : process(M_AXIS_ACLK)
begin
    if rising_edge(M_AXIS_ACLK) then
        if (M_AXIS_ARESETN = '0') then
            resetCycleCount <= "000000";
               internalEn <= '0';
         else
            resetCycleCount <= std_logic_vector(unsigned(resetCycleCount) + 1);

            if (to_integer(unsigned(resetCycleCount)) = 3) then
                internalEn <= '1';
             end if;

        end if;
    end if;
end  process count_reset_cycles;


--fifo_empty_delay : process(M_AXIS_ACLK)
--begin
--    if rising_edge(M_AXIS_ACLK) then

--        if (fifo_empty = '1') then
--            fifoSentEmpty <= TRUE;
--            fifoEmptyCycleCount <= "000";
--         elsif (fifoSentEmpty = FALSE) then
--            --internalFifoEmpty <= '0';
--         end if;

--         if (fifoSentEmpty = TRUE) then
--            fifoEmptyCycleCount <= std_logic_vector(unsigned(fifoEmptyCycleCount) + 1);
--            if (to_integer(unsigned(fifoEmptyCycleCount)) = 1) then
--               --internalFifoEmpty <= '1';
--               fifoSentEmpty <= FALSE;
--            end if;
--         end if;
--    end if;

--end process fifo_empty_delay;


--fifo_empty_buffers : process(M_AXIS_ACLK)
--begin
--    if rising_edge(M_AXIS_ACLK) then
--        stage1 <= fifo_empty;
--        stage2 <= stage1;
--        stage3 <= stage2;
--        internalFifoEmpty <= stage3;
--    end if;
--end process fifo_empty_buffers;

interrupt : process(M_AXIS_ACLK, M_AXIS_ARESETN)
begin
  if M_AXIS_ARESETN = '0' then
    intr0 <= '0';
elsif Rising_edge(M_AXIS_ACLK) then
    if to_integer(unsigned(fifo_rd_count)) > to_integer(unsigned(intrThreshold)) then
        intr0 <= '1';
    else
        intr0 <= '0';
    end if;
end if;
end process;


intr_pipe : process(M_AXIS_ACLK, M_AXIS_ARESETN)
begin
  if M_AXIS_ARESETN = '0' then
  intr1 <= '0';
  intr2 <= '0';
  intr <= '0';

elsif Rising_edge(M_AXIS_ACLK) then
    intr1<= intr0;
    intr2 <= intr1;
    intr <= intr2;

end if;
end process;


statemachine : process(M_AXIS_ACLK, M_AXIS_ARESETN)
begin
  if M_AXIS_ARESETN = '0' or reset = '1' then
      state <= idle;
  elsif Rising_edge(M_AXIS_ACLK) then
    state <= nextState;
  end if;
end process;


comb_statemachine : process(state, descriptors_ready, fifo_rd_count, packet_size, local_packet_counter, M_AXIS_TREADY)
begin
  nextState <= state;
  fifo_rd_enable <= '0';
  local_tlast <= '0';
  adc_reg <= "00000000000000000000000000000000";
  local_tvalid <= '0';


  case state is
    when idle =>
      if descriptors_ready = '1' then
        nextState <= enabled;
      end if;

    when enabled =>
    if (to_integer(unsigned(fifo_rd_count)) >= to_integer(unsigned(packet_size))) then
        nextState <= waitfortready;
--        fifo_rd_enable <= '1';
      end if;

  when waitfortready =>
    if M_AXIS_TREADY = '1' then
        nextState <= fifo_rd_en;
        fifo_rd_enable <= '1';
    end if;

    when fifo_rd_en =>
        fifo_rd_enable <= '1';
        nextState <= counting;
        local_tvalid <= '1';
        adc_reg <= data_in;


    when counting =>
    if M_AXIS_TREADY = '0' then -- if we're not ready dont do anything
        fifo_rd_enable <= '0';
        local_tvalid <= '0';
        local_tlast <= '0';
    elsif (local_packet_counter > STD_LOGIC_VECTOR(unsigned(packet_size)-2) ) then -- we're ready, send tlast
            local_tlast <= '1';
            fifo_rd_enable <= '0';
            nextState <= finish_last;
            local_tvalid <= '1';
    else    -- ready but keep looping, haven't reached the packet length yet
            fifo_rd_enable <= '1';
            local_tvalid <= '1';
    end if;
    adc_reg <= data_in;

--    last_word_send <= data_in;
    last_word_send <= (others => '0');
    
    when finish_last =>
        local_tlast <= '0';
        -- probably clear descriptors ready now..
        nextState <= wait_for_reset;

    when wait_for_reset =>
        if descriptors_ready = '0' then
            nextState <= idle;
        end if;


  end case;
end process;

--valid_setup : process(M_AXIS_ACLK)
--begin
--    if rising_edge(M_AXIS_ACLK) then
--        if (M_AXIS_ARESETN = '0') then
--            local_tvalid <= '0';
--            adc_reg <= "00000000000000000000000000000000";
--         else
--            if (descriptors_ready = '0') then
--                local_tvalid <= '0';
--             elsif (internalEn = '1') then
--                if (fifo_rd_count >= packet_size) then
--                    local_tvalid <= '1';
--                    adc_reg <= data_in;
--                else
--                    local_tvalid <= '0';
--                end if;
--            end if;
--        end if;
--    end if;
--end  process valid_setup;





packet_counter : process (M_AXIS_ACLK)
begin
    if rising_edge(M_AXIS_ACLK) then
        if (M_AXIS_ARESETN = '0' or reset = '1') then
            local_packet_counter <= "00000000000000000000000000000000";
         else
            if (local_tvalid = '1' and M_AXIS_TREADY = '1') then
                if (local_tlast = '1') then
                     local_packet_counter <= "00000000000000000000000000000000";
                 else
                       local_packet_counter <= std_logic_vector(unsigned(local_packet_counter) + 1);
                  end if;
            end if;
         end if;
     end if;
end  process packet_counter;


--frame : process(local_packet_counter)
--begin
--    if (local_packet_counter = packet_size) then --actual frame size -2
--        local_tlast <= '1';
--     else
--        local_tlast <= '0';
--     end if;
--end process frame;

end implementation;
