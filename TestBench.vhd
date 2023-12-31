LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY testBench IS
END testBench;

ARCHITECTURE bench OF testBench IS
    COMPONENT matrixProcessor IS
        PORT (
            CPU_CLK        : IN STD_LOGIC;
            ENABLE         : IN STD_LOGIC;
            INSTRUCTION_IN : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL cpu_clk, enable, ram_wr : STD_LOGIC                     := '0';
    SIGNAL prg_cnt                 : INTEGER                       := 0;
    SIGNAL instruction_in          : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    CONSTANT period  : TIME    := 600 ps;
    CONSTANT t       : TIME    := 100 ps; -- Periode dari setiap clock cycle
    CONSTANT max_clk : INTEGER := 48;     -- Maksimum clock cycle

BEGIN
    processor : matrixProcessor PORT MAP(cpu_clk => cpu_clk, enable => enable, instruction_in => instruction_in);

    clk_gen : PROCESS
    BEGIN
        cpu_clk <= '0';
        WAIT FOR t/2;
        cpu_clk <= '1';
        WAIT FOR t/2;

        IF (prg_cnt < max_clk) THEN
            prg_cnt <= prg_cnt + 1;
        ELSE
            WAIT;
        END IF;
    END PROCESS;

    testBench : PROCESS
    BEGIN
        enable <= '1';
        INSTRUCTION_IN <= "000000100000000001";
        WAIT FOR period;

        INSTRUCTION_IN <= "001000110000000001";
        WAIT FOR period;

        INSTRUCTION_IN <= "010001000000000000";
        WAIT FOR period;

        INSTRUCTION_IN <= "011001010000000000";
        WAIT FOR period;

        INSTRUCTION_IN <= "100001100000000000";
        WAIT FOR period;

        INSTRUCTION_IN <= "101001110000000000";
        WAIT FOR period;

        INSTRUCTION_IN <= "110010000000000000";
        WAIT FOR period;

        INSTRUCTION_IN <= "111010010000000001";
        WAIT;
    END PROCESS;

END ARCHITECTURE bench;
