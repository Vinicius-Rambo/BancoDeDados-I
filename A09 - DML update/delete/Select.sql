-- Comandos SELECT (faz na paciencia);

SELECT * FROM aluno;

SELECT id_aluno, nome, data_nascimento FROM aluno; -- exibe apenas as 3 colunas

--Exibe com nome diferente:

SELECT id_aluno AS id, nome, data_nascimento AS data FROM aluno; -- nome de forma diferente com AS (depricated);
SELECT id_aluno id, nome, data_nascimento data FROM aluno; --  Mostra o nome de forma diferente;

-- Forma com identação:
SELECT
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno;

-- Where aonde parar.
SELECT
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno
WHERE
    id_aluno <= 20; -- Mostra todos com id menor ou igual a 20.

--------------------------------------------------------------------
SELECT -- Mostra alunos que nasceram antes de 2015
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno
WHERE
    data_nascimento <= '31-12-2014'; -- Converte para o padrão AAAA-MM-DD,

--------------------------------------------------------------------
SELECT 
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno
WHERE
    data_nascimento >= '2014-05-01' AND data_nascimento <= '2014-05-31'; -- Só de maio de 2014

-----------------------------------------------------------------------------------------------
SELECT --Ordem alfabetica 
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno
WHERE
    data_nascimento <= '2014-12-31' -- Só de maio de 2014
ORDER BY nome ASC; --Alunos por ordem alfabetica
-----------------------------------------------------------------------------------------------
SELECT --Ordem de por nascimento 
    id_aluno AS id,
    nome,
    data_nascimento AS nascimento
FROM aluno
WHERE
    data_nascimento <= '2014-12-31' -- Só de maio de 2014
ORDER BY data_nascimento DESC; --Alunos por ordem alfabetica
---------------------------------------------------------------------------------------------
SELECT * FROM aluno LIMIT 5; --Vizualização limitada a 5 alunos 
SELECT * FROM aluno ORDER BY nome ASC LIMIT 5; -- Os 5 primeiros por ordem alfabetica
SELECT * FROM aluno ORDER BY nome ASC LIMIT 5 OFFSET 5; -- Os 5 primeiros da proxima aba

SELECT * FROM professor;

