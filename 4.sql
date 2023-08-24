-- Questão 1
SELECT * from funcionario where cod_func = 101;
DECLARE
    v_cod_func   funcionario.cod_func%type := 101;
    v_salario    funcionario.salario%type;
    v_nome_func  funcionario.nome_func%type;
BEGIN
    SELECT nome_func, salario INTO v_nome_func, v_salario
    FROM funcionario
    WHERE cod_func = v_cod_func;

    IF (v_salario >= 800 AND v_salario <= 2000) THEN
        v_salario := v_salario * 1.5;
    ELSIF (v_salario <= 3000) THEN
        v_salario := v_salario * 1.4;
    ELSE
        v_salario := v_salario * 1.1;
    END IF;

    UPDATE Funcionario SET salario = v_salario
    WHERE cod_func = v_cod_func;
END;
/

-- Questão 2
Select salario from Funcionario where cod_func = 101;

DROP TABLE Historico_Salario;
CREATE TABLE Historico_Salario
	(Cod_Func INTEGER,
	Salario_Novo INTEGER,
	Dt_Atualizacao DATE,
	PRIMARY KEY(Cod_Func, Salario_Novo)
);

DECLARE
    v_cod_func   funcionario.cod_func%type := 101;
    v_salario    funcionario.salario%type;
    v_nome_func  funcionario.nome_func%type;
	v_OutputStr  varchar2(200) := '';
BEGIN
    SELECT nome_func, salario INTO v_nome_func, v_salario
    FROM funcionario
    WHERE cod_func = v_cod_func;

    WHILE (v_salario < 10000) LOOP
        v_salario := v_salario * 1.1;
        UPDATE Funcionario SET salario = v_salario
        WHERE cod_func = v_cod_func;

        INSERT INTO Historico_Salario (cod_func, salario_novo, dt_atualizacao)
        VALUES (v_cod_func, v_salario, SYSDATE);
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('O código ' || v_cod_func || ' não existe');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

Select salario from Funcionario where cod_func = 101;

-- questão 3

DECLARE
    v_funcionario VARCHAR2(50) := 'Mario Souza';
    v_valor_hora NUMBER := 100;
    v_total_horas_trabalhadas NUMBER := 0;
    v_classificacao VARCHAR2(20);
    v_a_receber NUMBER;
BEGIN
    SELECT SUM(Horas_Trab) INTO v_total_horas_trabalhadas
    FROM Func_Proj fp
    JOIN Funcionario f ON fp.Cod_Func = f.Cod_Func
    WHERE f.Nome_Func = v_funcionario;

    v_a_receber := v_total_horas_trabalhadas * v_valor_hora;

    IF v_total_horas_trabalhadas >= 200 THEN
        v_classificacao := 'ótima participação';
    ELSIF v_total_horas_trabalhadas >= 100 THEN
        v_classificacao := 'boa participação';
    ELSE
        v_classificacao := 'participação normal';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Valor a receber: ' || v_a_receber);
    DBMS_OUTPUT.PUT_LINE('Classificação: ' || v_classificacao);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Funcionário ' || v_funcionario || ' não encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;
/
