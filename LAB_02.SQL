---1) Obtenha o nome da ‘Esposa’ do empregado de nome ‘Jose’.
SELECT D.NOME_DEP FROM DEPENDENTES D WHERE GRAU_PARENTESCO = 'Esposa' AND COD_EMP IN(SELECT COD_EMP FROM EMPREGADOS WHERE NOME = 'Jose' );

---2) Obtenha a quantidade de empregados que a empregada ‘Ana’ supervisiona.
SELECT COUNT(COD_EMP) FROM EMPREGADOS WHERE COD_EMP_SUPERV = (SELECT COD_EMP FROM EMPREGADOS WHERE NOME = 'Ana');

---3) Obtenha o nome de cada departamento e a quantidade de projetos que cada um coordena, mas somente 
---para aqueles departamentos que coordenam mais projetos que o departamento ‘Central’.

SELECT D.NOME_DEPTO, COUNT(P.COD_PROJ) 
FROM DEPARTAMENTOS D INNER JOIN PROJETOS P 
ON D.COD_DEPTO = P.COD_DEPTO
GROUP BY D.NOME_DEPTO
HAVING COUNT(P.COD_PROJ) > (SELECT COUNT(P.COD_PROJ)
							FROM PROJETOS P INNER JOIN DEPARTAMENTOS D
							ON D.COD_DEPTO = P.COD_DEPTO
							WHERE D.NOME_DEPTO = 'Central');

---4) Obtenha o nome das máquinas que o empregado ‘Joao’ utilizou nos projetos ‘ProdutoY’ ou 
--‘Reorganizacao’.
SELECT M.NOME_MAQ 
FROM MAQUINAS M 
WHERE M.COD_MAQ in (SELECT COD_MAQ 
					FROM UTILIZA 
    				WHERE COD_PROJ in (SELECT COD_PROJ
    								   FROM UTILIZA 
    								   WHERE COD_EMP in (SELECT COD_EMP
    													FROM EMPREGADOS 
    													WHERE NOME in 'Joao')));
--5) Aumente em 20% o salário dos empregados do departamento de ‘Pesquisa’.
SELECT SALARIO + SALARIO * 20/100 AS SALARIO
FROM EMPREGADOS WHERE
COD_DEPTO IN (SELECT COD_DEPTO 
    		  FROM DEPARTAMENTOS
    		  WHERE NOME_DEPTO = 'Pesquisa')


--6) Elimine da tabela Utiliza todos as informações referentes aos projetos e às máquinas que a empregada 
--‘Renata’ trabalhou.
DELETE FROM UTILIZA
WHERE COD_EMP IN (SELECT COD_EMP 
    			  FROM EMPREGADOS
    			  WHERE NOME = 'Renata')

SELECT * FROM UTILIZA
