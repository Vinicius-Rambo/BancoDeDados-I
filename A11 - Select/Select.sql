-- Faça consultas (SELECTS) para:
-- 1. Listar todas as vendas a partir de 2025-01-01, ordenadas do maior para o menor valor.
-- 2. Listar veículos vendidos com marca e modelo.
-- 3. Quantidade de veículos vendidos por marca.
-- 4. Valor total vendido por corretor, mostrando apenas quem vendeu mais de 100.000.
-- 5. Valor médio por marca, do maior para o menor.
-- 6. Corretores com número de vendas (apenas quem tem pelo menos 3 vendas).
-- 7. Compradores que já realizaram compra acima de 80.000.
-- 8. Quantidade de vendas por mês (ano-mês), do mais recente ao mais antigo.
-- 9. Top 5 modelos mais vendidos.
-- 10.Média de quilometragem dos veículos vendidos por marca (mostrar só quem tem média >
-- 50.000).
-- 11.Veículos vendidos em 2024, ordenados por ano de fabricação (mais novos primeiro).
-- 12.Total de comissão pago por corretor, apenas quem recebeu mais de 10.000 de comissão.
-- 13.Compradores casados que já compraram algum veículo (com nome do cônjuge).

--1
SELECT * FROM venda
WHERE data_venda >= '2025-01-01'
ORDER BY valor_venda DESC;

--2
SELECT id_venda, nome_marca, nome_modelo FROM venda
JOIN veiculo USING (id_veiculo)
JOIN marca USING (id_marca)
JOIN modelo USING (id_modelo);

--3 
SELECT nome_marca, COUNT(*) AS qtd_vendidos
FROM venda
JOIN veiculo USING (id_veiculo)
JOIN modelo USING (id_modelo)
JOIN marca USING (id_marca)
GROUP BY nome_marca; --Ordena pelos nomes das marcas

--4                              
SELECT nome_corretor, SUM(valor_venda) AS total_vendido --Função de soma  
FROM venda
JOIN corretor USING (id_corretor)
GROUP BY nome_corretor --Agrupado pelo nome do corretor
HAVING SUM(valor_venda) > 100000; --Filtra por valor maior do que 10000

--5
SELECT cod_marca AS marca,
        AVG(valor_venda) AS media
FROM venda
JOIN veiculo USING (id_veiculo)
JOIN modelo USING (id_modelo)
JOIN marca USING (id_marca)
GROUP BY cod_marca --Agrupa pelo codigo da marca
GROUP BY AVG(valor_venda) DESC; --Organiza pelo valor menor para maior.

--6
SELECT id_corretor, nome_corretor, COUNT(*) as num_vendas
FROM venda
JOIN corretor USING (id_corretor)
GROUP BY id_corretor, nome_corretor
HAVING COUNT(*) >= 3
ORDER BY COUNT(*) ASC;

--7
SELECT nome_compr FROM venda
JOIN comprador USING (id_compr)
WHERE valor_venda > 80000;

--8
SELECT 
    TO_CHAR(data_venda, 'YYYY-MM') AS data, --Transforma um valor "Date" em string no formato a frente no caso YYYY-MM
    COUNT(*) AS vendas
FROM venda
GROUP BY data
ORDER BY data ASC;

--9
SELECT 
    COUNT(*) AS qtd_vendas
    cod_marca AS marca
    nome_modelo AS modelo
FROM venda
JOIN veiculo USING (id_veiculo)    
JOIN marca USING (id_marca)    
JOIN modelo USING (id_modelo)
GROUP BY cod_marca, nome_modelo
ORDER BY COUNT(*) DESC
LIMIT 5;

--10 FALTA o NUMERIC
SELECT 
    cod_marca AS marca,
    nome_modelo AS modelo,
    AVG(quilometragem) AS KM
FROM venda
JOIN veiculo USING(id_veiculo)
JOIN modelo USING(id_modelo)
JOIN marca USING(id_marca)
GROUP BY cod_marca, nome_modelo, quilometragem
HAVING AVG (quilometragem) > 50000
ORDER BY AVG (quilometragem) DESC;

--11 
SELECT
    id_veiculo
    num_chassi,
    ano_fabrica,
    nome_modelo,
    cod_marca
FROM venda 
JOIN veiculo USING (id_veiculo)
JOIN modelo USING (id_modelo)
JOIN marca USING (id_marca)
WHERE ano_fabrica >= '2024-01-01' AND ano_fabrica <= '2024-12-31'
ORDER BY ano_fabrica DESC;

--12
SELECT 
    id_corretor,
    nome_corretor,
    SUM(comissao_corretor) AS total_comissao
FROM venda
JOIN corretor USING (id_corretor)
GROUP BY id_corretor, nome_corretor
HAVING SUM(comissao_corretor) > 10000
ORDER BY SUM(comissao_corretor) DESC;

--13 Refazer depois
SELECT
    id_venda,
    id_compr,
    id_veiculo,
    data_venda,
    nome_compr,
    cpf_compr,
    nome_conjuge
FROM venda
JOIN comprador USING (id_compr)
WHERE estado_civil ILIKE 'casado';
