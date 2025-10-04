--1 Mostre todos os tipos de plantas comportadas na faculdade, com suas informações.
SELECT nome_planta AS Nome,
       nome_cientifico AS Cientifico,
       tipo_solo AS Solo,
       local AS Setor
FROM planta
JOIN nome_planta USING (id_nome)
JOIN solo USING (id_solo)
JOIN setor USING (id_setor)
ORDER BY Setor;

--2. Mostre os dias que os membros podem visitar no formato das 3 primeiras letras do dia.
SELECT 
    SUBSTRING(nome_dia FROM 1 FOR 3) AS Dia,
    nome_membro AS Membro
FROM membro_dia
JOIN membro USING (id_membro)
JOIN dia_visita USING (id_dia)
ORDER BY id_dia;

--3. Mostre os dias que os membros visitaram, qual o dia permitido e qual foi o dia que o mesmo visitou.
SELECT 
    nome_membro AS Nome, 
    nome_dia AS Dia_Permitido, 
    TO_CHAR(data_revisao, 'Day') AS Dia_Visitado, 
    data_revisao AS Data_Visitou 
    FROM membro 
    JOIN membro_dia USING (id_membro) 
    JOIN dia_visita USING (id_dia) 
    JOIN monitoramento USING (id_membro_dia)
    ORDER BY id_dia;

--4. Mostre todos os monitormentos de "Charles Darwin" e "Galileu Galilei".
SELECT nome_membro AS Membro,
       data_revisao AS Data,
       tamanho_cm AS Tamanho,
       nome_planta AS Planta
FROM monitoramento
JOIN membro_dia USING (id_membro_dia)
JOIN membro USING (id_membro)
JOIN planta USING (id_planta)
JOIN nome_planta USING (id_nome)
WHERE nome_membro IN ('Charles Darwin', 'Galileu Galilei') --Limitado para os 2
ORDER BY Data;

--5. Mostre os setores mais Visitados ordenas pela quantidade de monitoramento e depois por data.
SELECT local AS Setor,
       data_revisao AS Data,
       COUNT(*) AS Total_monitoramentos
FROM monitoramento
JOIN planta USING (id_planta)
JOIN setor USING (id_setor)
GROUP BY local, data_revisao
ORDER BY Total_monitoramentos DESC, Data ASC;
