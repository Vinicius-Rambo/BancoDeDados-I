UPDATE professor SET nome = 'Isabela Marins' Where id_professor = 9; -- Alterando o nome

DELETE FROM professor WHERE id_professor = 9;

--Operador like/ileke

SELECT * FROM responsavel WHERE nome LIKE 'Jo%'; --Seleciona pelo começo JO modo: Sensitive case 
SELECT * FROM responsavel WHERE nome LIKE '%jo'; --Seleciona pelo final JO  modo: Sensitive case


SELECT * FROM responsavel WHERE nome ILIKE '%Jo'; --Seleciona pelo final JO modo: isensitive case

SELECT * FROM responsavel WHERE nome ILIKE '%Jo%'; --Seleciona se have um JO modo: isensitive case

--Select usando Between:

SELECT * FROM responsavel WHERE id_responsavel Between 1 and 7; -- Between => entre 1 e 7 inclusivo 

SELECT * FROM responsavel WHERE id_responsavel IN (2, 12, 22, 32); -- Seleciona especificos.