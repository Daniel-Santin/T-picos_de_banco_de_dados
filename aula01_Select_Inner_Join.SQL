---Laboratorio 01 - Inner Join / Left Join
---Pedro Lucena - 32055633
---Daniel Ferreira Santin - 32037139
 
set echo on
 
 -- Questão 01
 -- Retorne o nome de cada aluno que já tenha cursado disciplinas, e para cada aluno, a sua nota média 
 --(considerando todas as disciplinas cursadas).
 
SELECT A.NOME_ALUNO, AVG(AD.NOTA)
FROM ALUNO A INNER JOIN ALUNO_DISC AD
ON A.MATRICULA = AD.MATRICULA
GROUP BY A.NOME_ALUNO;
 
 -- Questão 02
 -- Retorne o nome de todos os cursos (mesmo daqueles que não tenham disciplinas cadastradas) e a quantidade 
 --de disciplinas de cada curso.
 
SELECT C.NOME_CURSO, COUNT(D.COD_DISCIPLINA)
FROM CURSO C LEFT JOIN DISCIPLINA D
ON C.COD_CURSO = D.COD_CURSO
GROUP BY C.NOME_CURSO;


 
 -- Questão 03
 -- Retorne o nome de todos os alunos (mesmo daqueles que ainda não finalizaram nenhuma disciplina) e, para 
 -- cada aluno, o número de disciplinas cursadas.
 
SELECT A.NOME_ALUNO, COUNT(AD.MATRICULA)
FROM ALUNO A LEFT JOIN ALUNO_DISC AD
ON A.MATRICULA = AD.MATRICULA
GROUP BY A.NOME_ALUNO;

---4) Retorne o nome de todos os alunos da universidade (mesmo daqueles que ainda não finalizaram nenhuma 
---disciplina), os nomes das disciplinas e as notas de cada uma das disciplinas que os alunos cursaram.
SELECT A.NOME_ALUNO, D.NOME_DISCIPLINA , AD.NOTA
FROM ALUNO A LEFT JOIN ALUNO_DISC AD
ON A.MATRICULA = AD.MATRICULA 
LEFT JOIN DISCIPLINA D
ON AD.COD_DISCIPLINA = D.COD_DISCIPLINA;

---5) (nesta questão utilize LEFT JOIN e RIGHT JOIN) Retorne o nome de todos os professores da 
---universidade (mesmo aqueles que não estão ministrando disciplinas), e os nomes das disciplinas que eles ministram
SELECT P.NOME_PROFESSOR, D.NOME_DISCIPLINA
FROM DISCIPLINA D LEFT JOIN PROF_DISC PD
ON PD.COD_DISCIPLINA = D.COD_DISCIPLINA 
RIGHT JOIN PROFESSOR P 
ON P.COD_PROFESSOR = PD.COD_PROFESSOR;
 
