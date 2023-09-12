-- GUSTAVO DUARTE ALVES 32081286
-- PEDRO GALVAO BARRETTO 32016591

-- 1. Criar uma procedure, utilizando cursor, para exibir o resultado da consulta que:
-- Retorne o nome de cada aluno que já tenha cursado disciplinas,\
-- e para cada aluno, a sua nota média (considerando todas as disciplinas cursadas).

CREATE OR REPLACE PROCEDURE consulta_media IS
    CURSOR aluno_media IS
        SELECT a.nome_aluno, AVG(ad.nota) AS MEDIA
        FROM aluno a
        INNER JOIN aluno_disc ad ON a.matricula = ad.matricula
        GROUP BY a.nome_aluno;
    reg_aluno_media aluno_media%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('MÉDIA DOS ALUNOS');
    FOR reg_aluno_media IN aluno_media LOOP
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(reg_aluno_media.nome_aluno) || ' ' ||
                             TO_CHAR(reg_aluno_media.media, '999.99'));
    END LOOP;
END consulta_media;
/

EXECUTE consulta_media;


-- 2. Criar uma procedure, utilizando cursor, para exibir o resultado da consulta que:
-- Retorne o nome de todos os alunos da universidade (mesmo daqueles que ainda não finalizaram nenhuma disciplina),
-- os nomes das disciplinas e as notas de cada uma das disciplinas que os alunos cursaram.

CREATE OR REPLACE PROCEDURE consulta_alunos_disciplinas_notas IS
    CURSOR alunos_disciplinas_notas_cur IS
        SELECT
            a.nome_aluno,
            d.nome_disciplina,
            ad.nota
        FROM
            aluno a
        LEFT JOIN
            aluno_disc ad
        ON
            a.matricula = ad.matricula
        LEFT JOIN
            disciplina d
        ON
            ad.cod_disciplina = d.cod_disciplina;
    reg_alunos_disciplinas_notas alunos_disciplinas_notas_cur%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('ALUNOS, DISCIPLINAS E NOTAS');
    FOR reg_alunos_disciplinas_notas IN alunos_disciplinas_notas_cur LOOP
        DBMS_OUTPUT.PUT_LINE(
            TO_CHAR(reg_alunos_disciplinas_notas.nome_aluno) || ' ' ||
            TO_CHAR(reg_alunos_disciplinas_notas.nome_disciplina) || ' ' ||
            TO_CHAR(reg_alunos_disciplinas_notas.nota, '999.99')
        );
    END LOOP;
END consulta_alunos_disciplinas_notas;
/

EXECUTE consulta_alunos_disciplinas_notas;
