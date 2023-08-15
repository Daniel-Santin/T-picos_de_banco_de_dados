-- 1) Obtenha o nome de cada empregado e o nome do seu respectivo supervisor.


-- 2) Obtenha o nome do supervisor do empregado de nome ‘Jose’.

SELECT NOME FROM EMPREGADOS WHERE COD_EMP IN (SELECT COD_EMP_SUPERV FROM EMPREGADOS WHERE NOME = 'Jose');

-- 3) Obtenha a quantidade de empregados que a ‘Ana’ supervisiona.

SELECT COUNT(COD_EMP) FROM EMPREGADOS WHERE COD_EMP_SUPERV = (SELECT COD_EMP FROM EMPREGADOS WHERE NOME = 'Ana');

-- 4) Obtenha o nome de cada empregado e a quantidade de dependentes que cada um tem, mas desde que essa quantidade seja maior ou igual a 2 dependentes.

-- 5) Obtenha o nome das máquinas que o empregado ‘Joao’ utilizou nos projetos ‘ProdutoY’ ou 'Reorganizacao’.

SELECT M.NOME_MAQ 
FROM MAQUINAS M 
WHERE M.COD_MAQ in (SELECT COD_MAQ 
					          FROM UTILIZA 
    				        WHERE COD_PROJ in (SELECT COD_PROJ
    								                   FROM UTILIZA 
    								                   WHERE COD_EMP in (SELECT COD_EMP
    													                            FROM EMPREGADOS 
    													                            WHERE NOME in 'Joao')));
