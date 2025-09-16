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