SELECT ceil(12.8);  --Arredonda para cima
SELECT floor(12.8);  --Arredonda para baixo.

SELECT 5 % 4; --Modulo

SELECT @ -123; --Valor absoluto

SELECT ceil(random()*20); --Aleatorio

SELECT lower('TEXTO'); --Tudo minusculo
SELECT UPPER('texto'); --Tudo maiusculo

SELECT LENGTH('Texto'); --Tamanho do texto

SELECT md5('Texto'); --Criptografra o texto

SELECT substring('nome' from 2 for 7); -- Cria uma substring, começando da 2, com 7 letras totais.

SELECT current_timestamp; --Mostra a hora atual.

SELECT 'vinicius' || ' - ' || 'Rambo'; --Concatenação pipe de duas strings
