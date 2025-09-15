
SELECT * FROM comprador;
SELECT * FROM corretor;


-- Ver veiculos com suas marcas e modelos.
SELECT num_placa,
       cor,
       ano_fabrica,
       quilometragem,
       nome_modelo AS modelo,
       nome_marca AS marca
FROM veiculo
JOIN modelo USING (id_modelo)
JOIN marca USING (id_marca);


-- Ver a venda completa
SELECT id_venda,
       valor_venda AS Preço,
       comissao_corretor AS comissão,
       data_venda,
       nome_compr AS comprador,
       nome_corretor AS corretor,
       num_placa,
       cor
FROM venda
JOIN comprador USING (id_compr)
JOIN corretor USING (id_corretor)
JOIN veiculo USING (id_veiculo);
