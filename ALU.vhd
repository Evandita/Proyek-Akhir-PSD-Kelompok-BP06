LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS
    PORT (
        -- Program counter
        PRG_CNT : IN INTEGER;

        -- Bentuk operasi yang akan dilakukan pada matriks
        OPCODE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

        -- Output untuk menyimpan hasil determinan matriks
        DETER_MAT_A : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        DETER_MAT_B : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        DETER_MAT_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

        -- Operand D untuk menyimpan hasil matriks
        OPERAND_11_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_12_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_13_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_21_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_22_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_23_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_31_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_32_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_33_D : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

        -- Operand A untuk melakukan operasi matriks 
        OPERAND_11_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_12_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_13_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_21_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_22_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_23_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_31_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_32_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_33_A : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

        -- Operand B untuk melakukan operasi matriks 
        OPERAND_11_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_12_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_13_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_21_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_22_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_23_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_31_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_32_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        OPERAND_33_B : IN STD_LOGIC_VECTOR (7 DOWNTO 0)

    );
END ENTITY ALU;

ARCHITECTURE rtl OF ALU IS
    SIGNAL Result_det_A, Result_det_B, Result_det_D : signed(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Result_D_11, Result_D_12, Result_D_13, Result_D_21, Result_D_22, Result_D_23, Result_D_31, Result_D_32, Result_D_33 : signed(7 DOWNTO 0) := (OTHERS => '0');
BEGIN

    -- Determinan Matriks 3x3

    Result_det_A <= resize((SIGNED(OPERAND_11_A) * SIGNED(OPERAND_22_A) * SIGNED(OPERAND_33_A)) + (SIGNED(OPERAND_12_A) * SIGNED(OPERAND_23_A) * SIGNED(OPERAND_31_A)) + (SIGNED(OPERAND_13_A) * SIGNED(OPERAND_21_A) * SIGNED(OPERAND_32_A)) - (SIGNED(OPERAND_31_A) * SIGNED(OPERAND_22_A) * SIGNED(OPERAND_13_A)) - (SIGNED(OPERAND_32_A) * SIGNED(OPERAND_23_A) * SIGNED(OPERAND_11_A)) - (SIGNED(OPERAND_33_A) * SIGNED(OPERAND_21_A) * SIGNED(OPERAND_12_A)), Result_det_A'length);
    Result_det_B <= resize((SIGNED(OPERAND_11_B) * SIGNED(OPERAND_22_B) * SIGNED(OPERAND_33_B)) + (SIGNED(OPERAND_12_B) * SIGNED(OPERAND_23_B) * SIGNED(OPERAND_31_B)) + (SIGNED(OPERAND_13_B) * SIGNED(OPERAND_21_B) * SIGNED(OPERAND_32_B)) - (SIGNED(OPERAND_31_B) * SIGNED(OPERAND_22_B) * SIGNED(OPERAND_13_B)) - (SIGNED(OPERAND_32_B) * SIGNED(OPERAND_23_B) * SIGNED(OPERAND_11_B)) - (SIGNED(OPERAND_33_B) * SIGNED(OPERAND_21_B) * SIGNED(OPERAND_12_B)), Result_det_B'length);
    Result_det_D <= resize((SIGNED(Result_D_11) * SIGNED(Result_D_22) * SIGNED(Result_D_33)) + (SIGNED(Result_D_12) * SIGNED(Result_D_23) * SIGNED(Result_D_31)) + (SIGNED(Result_D_13) * SIGNED(Result_D_21) * SIGNED(Result_D_32)) - (SIGNED(Result_D_31) * SIGNED(Result_D_22) * SIGNED(Result_D_13)) - (SIGNED(Result_D_32) * SIGNED(Result_D_23) * SIGNED(Result_D_11)) - (SIGNED(Result_D_33) * SIGNED(Result_D_21) * SIGNED(Result_D_12)), Result_det_D'length);

    -- Data Flow

    DETER_MAT_A <= STD_LOGIC_VECTOR(Result_det_A);
    DETER_MAT_B <= STD_LOGIC_VECTOR(Result_det_B);
    DETER_MAT_D <= STD_LOGIC_VECTOR(Result_det_D);

    OPERAND_11_D <= STD_LOGIC_VECTOR(Result_D_11);
    OPERAND_12_D <= STD_LOGIC_VECTOR(Result_D_12);
    OPERAND_13_D <= STD_LOGIC_VECTOR(Result_D_13);
    OPERAND_21_D <= STD_LOGIC_VECTOR(Result_D_21);
    OPERAND_22_D <= STD_LOGIC_VECTOR(Result_D_22);
    OPERAND_23_D <= STD_LOGIC_VECTOR(Result_D_23);
    OPERAND_31_D <= STD_LOGIC_VECTOR(Result_D_31);
    OPERAND_32_D <= STD_LOGIC_VECTOR(Result_D_32);
    OPERAND_33_D <= STD_LOGIC_VECTOR(Result_D_33);
    ALU_PROC : PROCESS (PRG_CNT)
    BEGIN
        CASE OPCODE IS
                -- Penjumlahan matriks
            WHEN "000" =>
                Result_D_11 <= (SIGNED(OPERAND_11_A) + SIGNED(OPERAND_11_B));
                Result_D_12 <= (SIGNED(OPERAND_12_A) + SIGNED(OPERAND_12_B));
                Result_D_13 <= (SIGNED(OPERAND_13_A) + SIGNED(OPERAND_13_B));
                Result_D_21 <= (SIGNED(OPERAND_21_A) + SIGNED(OPERAND_21_B));
                Result_D_22 <= (SIGNED(OPERAND_22_A) + SIGNED(OPERAND_22_B));
                Result_D_23 <= (SIGNED(OPERAND_23_A) + SIGNED(OPERAND_23_B));
                Result_D_31 <= (SIGNED(OPERAND_31_A) + SIGNED(OPERAND_31_B));
                Result_D_32 <= (SIGNED(OPERAND_32_A) + SIGNED(OPERAND_32_B));
                Result_D_33 <= (SIGNED(OPERAND_33_A) + SIGNED(OPERAND_33_B));
                -- Pengurangan matriks
            WHEN "001" =>
                Result_D_11 <= (SIGNED(OPERAND_11_A) - SIGNED(OPERAND_11_B));
                Result_D_12 <= (SIGNED(OPERAND_12_A) - SIGNED(OPERAND_12_B));
                Result_D_13 <= (SIGNED(OPERAND_13_A) - SIGNED(OPERAND_13_B));
                Result_D_21 <= (SIGNED(OPERAND_21_A) - SIGNED(OPERAND_21_B));
                Result_D_22 <= (SIGNED(OPERAND_22_A) - SIGNED(OPERAND_22_B));
                Result_D_23 <= (SIGNED(OPERAND_23_A) - SIGNED(OPERAND_23_B));
                Result_D_31 <= (SIGNED(OPERAND_31_A) - SIGNED(OPERAND_31_B));
                Result_D_32 <= (SIGNED(OPERAND_32_A) - SIGNED(OPERAND_32_B));
                Result_D_33 <= (SIGNED(OPERAND_33_A) - SIGNED(OPERAND_33_B));
                -- Pencerminan matriks sumbu x
            WHEN "010" =>
                Result_D_11 <= (SIGNED(OPERAND_11_A));
                Result_D_12 <= (SIGNED(NOT OPERAND_12_A) + 1);
                Result_D_13 <= (SIGNED(OPERAND_13_A));
                Result_D_21 <= (SIGNED(OPERAND_21_A));
                Result_D_22 <= (SIGNED(NOT OPERAND_22_A) + 1);
                Result_D_23 <= (SIGNED(OPERAND_23_A));
                Result_D_31 <= (SIGNED(OPERAND_31_A));
                Result_D_32 <= (SIGNED(NOT OPERAND_32_A) + 1);
                Result_D_33 <= (SIGNED(OPERAND_33_A));
                -- Pencerminan matriks sumbu y
            WHEN "011" =>
                Result_D_11 <= (SIGNED(NOT OPERAND_11_A) + 1);
                Result_D_12 <= (SIGNED(OPERAND_12_A));
                Result_D_13 <= (SIGNED(OPERAND_13_A));
                Result_D_21 <= (SIGNED(NOT OPERAND_21_A) + 1);
                Result_D_22 <= (SIGNED(OPERAND_22_A));
                Result_D_23 <= (SIGNED(OPERAND_23_A));
                Result_D_31 <= (SIGNED(NOT OPERAND_31_A) + 1);
                Result_D_32 <= (SIGNED(OPERAND_32_A));
                Result_D_33 <= (SIGNED(OPERAND_33_A));
                -- Pencerminan matriks A terhadap sumbu z
            WHEN "100" =>
                Result_D_11 <= (SIGNED(NOT OPERAND_11_A) + 1);
                Result_D_12 <= (SIGNED(NOT OPERAND_12_A) + 1);
                Result_D_13 <= (SIGNED(OPERAND_13_A));
                Result_D_21 <= (SIGNED(NOT OPERAND_21_A) + 1);
                Result_D_22 <= (SIGNED(NOT OPERAND_22_A) + 1);
                Result_D_23 <= (SIGNED(OPERAND_23_A));
                Result_D_31 <= (SIGNED(NOT OPERAND_31_A) + 1);
                Result_D_32 <= (SIGNED(NOT OPERAND_32_A) + 1);
                Result_D_33 <= (SIGNED(OPERAND_33_A));
                -- Transpose matriks A
            WHEN "101" =>
                Result_D_11 <= (SIGNED(OPERAND_11_A));
                Result_D_12 <= (SIGNED(OPERAND_21_A));
                Result_D_13 <= (SIGNED(OPERAND_31_A));
                Result_D_21 <= (SIGNED(OPERAND_12_A));
                Result_D_22 <= (SIGNED(OPERAND_22_A));
                Result_D_23 <= (SIGNED(OPERAND_32_A));
                Result_D_31 <= (SIGNED(OPERAND_13_A));
                Result_D_32 <= (SIGNED(OPERAND_23_A));
                Result_D_33 <= (SIGNED(OPERAND_33_A));
                -- Kofaktor matriks A
            WHEN "110" =>

                Result_D_11 <= resize((SIGNED(OPERAND_22_A) * SIGNED(OPERAND_33_A)) - (SIGNED(OPERAND_23_A) * SIGNED(OPERAND_32_A)), Result_D_11'length);
                Result_D_12 <= resize(-1 * ((SIGNED(OPERAND_21_A) * SIGNED(OPERAND_33_A)) - (SIGNED(OPERAND_23_A) * SIGNED(OPERAND_31_A))), Result_D_12'length);
                Result_D_13 <= resize((SIGNED(OPERAND_21_A) * SIGNED(OPERAND_32_A)) - (SIGNED(OPERAND_22_A) * SIGNED(OPERAND_31_A)), Result_D_13'length);

                Result_D_21 <= resize(-1 * ((SIGNED(OPERAND_12_A) * SIGNED(OPERAND_33_A)) - (SIGNED(OPERAND_13_A) * SIGNED(OPERAND_32_A))), Result_D_21'length);
                Result_D_22 <= resize((SIGNED(OPERAND_11_A) * SIGNED(OPERAND_33_A)) - (SIGNED(OPERAND_13_A) * SIGNED(OPERAND_31_A)), Result_D_22'length);
                Result_D_23 <= resize(-1 * ((SIGNED(OPERAND_11_A) * SIGNED(OPERAND_32_A)) - (SIGNED(OPERAND_12_A) * SIGNED(OPERAND_31_A))), Result_D_23'length);

                Result_D_31 <= resize((SIGNED(OPERAND_12_A) * SIGNED(OPERAND_23_A)) - (SIGNED(OPERAND_13_A) * SIGNED(OPERAND_22_A)), Result_D_31'length);
                Result_D_32 <= resize(-1 * ((SIGNED(OPERAND_11_A) * SIGNED(OPERAND_23_A)) - (SIGNED(OPERAND_13_A) * SIGNED(OPERAND_21_A))), Result_D_32'length);
                Result_D_33 <= resize((SIGNED(OPERAND_11_A) * SIGNED(OPERAND_22_A)) - (SIGNED(OPERAND_12_A) * SIGNED(OPERAND_21_A)), Result_D_33'length);

                -- Perkalian Matriks
            WHEN "111" =>
                Result_D_11 <= resize(SIGNED(OPERAND_11_A) * SIGNED(OPERAND_11_B) + SIGNED(OPERAND_12_A) * SIGNED(OPERAND_21_B) + SIGNED(OPERAND_13_A) * SIGNED(OPERAND_31_B), Result_D_11'length);
                Result_D_12 <= resize(SIGNED(OPERAND_11_A) * SIGNED(OPERAND_12_B) + SIGNED(OPERAND_12_A) * SIGNED(OPERAND_22_B) + SIGNED(OPERAND_13_A) * SIGNED(OPERAND_32_B), Result_D_12'length);
                Result_D_13 <= resize(SIGNED(OPERAND_11_A) * SIGNED(OPERAND_13_B) + SIGNED(OPERAND_12_A) * SIGNED(OPERAND_23_B) + SIGNED(OPERAND_13_A) * SIGNED(OPERAND_33_B), Result_D_13'length);
                Result_D_21 <= resize(SIGNED(OPERAND_21_A) * SIGNED(OPERAND_11_B) + SIGNED(OPERAND_22_A) * SIGNED(OPERAND_21_B) + SIGNED(OPERAND_23_A) * SIGNED(OPERAND_31_B), Result_D_21'length);
                Result_D_22 <= resize(SIGNED(OPERAND_21_A) * SIGNED(OPERAND_12_B) + SIGNED(OPERAND_22_A) * SIGNED(OPERAND_22_B) + SIGNED(OPERAND_23_A) * SIGNED(OPERAND_32_B), Result_D_22'length);
                Result_D_23 <= resize(SIGNED(OPERAND_21_A) * SIGNED(OPERAND_13_B) + SIGNED(OPERAND_22_A) * SIGNED(OPERAND_23_B) + SIGNED(OPERAND_23_A) * SIGNED(OPERAND_33_B), Result_D_23'length);
                Result_D_31 <= resize(SIGNED(OPERAND_31_A) * SIGNED(OPERAND_11_B) + SIGNED(OPERAND_32_A) * SIGNED(OPERAND_21_B) + SIGNED(OPERAND_33_A) * SIGNED(OPERAND_31_B), Result_D_31'length);
                Result_D_32 <= resize(SIGNED(OPERAND_31_A) * SIGNED(OPERAND_12_B) + SIGNED(OPERAND_32_A) * SIGNED(OPERAND_22_B) + SIGNED(OPERAND_33_A) * SIGNED(OPERAND_32_B), Result_D_32'length);
                Result_D_33 <= resize(SIGNED(OPERAND_31_A) * SIGNED(OPERAND_13_B) + SIGNED(OPERAND_32_A) * SIGNED(OPERAND_23_B) + SIGNED(OPERAND_33_A) * SIGNED(OPERAND_33_B), Result_D_33'length);
            WHEN OTHERS =>

        END CASE;
    END PROCESS;
END ARCHITECTURE rtl;