INSERT INTO setor (local) VALUES
('Horta 1'),
('Horta 2'),
('Estufa 1'),
('Estufa 2');

INSERT INTO solo (tipo_solo, caracteristicas) VALUES
('Argiloso', 'Retém bastante água e nutrientes mas drena lento .'),
('Arenoso', 'Drena rápido, pouca retenção de nutrientes'),
('Humoso', 'Rico em matéria orgânica e muito fértil.'),
('Calcário', 'Boa drenagem e pH alcalino, pode limitar certos nutrientes.'),
('Misto', 'Equilíbrio entre areia e argila.');

INSERT INTO nome_planta (nome_planta, nome_cientifico) VALUES
('Couve', 'Brassica oleracea'),         --1
('Cenoura', 'Daucus carota'),           --2
('Alface', 'Lactuca sativa'),           --3
('Batata', 'Solanum tuberosum'),        --4
('Beterraba', 'Beta vulgaris'),         --5
('Tomate', 'Solanum lycopersicum'),     --6    
('Rabanete', 'Raphanus sativus'),       --7
('Manjericão', 'Ocimum basilicum'),     --8
('Salsinha', 'Petroselinum crispum'),   --9
('Cebolinha', 'Allium fistulosum');     --10

INSERT INTO planta (id_nome, id_solo, id_setor) VALUES
(1,1,1),
(2,2,3),
(3,3,1),
(4,3,1),
(5,1,4),
(6,4,2),
(2,3,2),
(1,2,4),
(5,1,3),
(10,3,4),
(9,2,1),
(8,3,2),
(2,1,1),
(4,2,1);

INSERT INTO membro (nome_membro, matricula_membro, curso_membro, ano_faculdade) VALUES
('Galileu Galilei', 1564, 'Fisica', 4),
('Charles Darwin', 1809, 'Biologia', 3),
('Ana Castelo', 2007, 'Biologia', 1),
('Antoine Lavoiser', 1743, 'Quimico', 1),
('Tom Jobin', 1925, 'Musica', 3),
('Angenor de Oliveira', 1908, 'Musica', 2),
('Wandelei Marques', 2091, 'Ciência da computação', 5);

INSERT INTO dia_Visita (nome_dia) VALUES
('Domingo'),
('Segunda-feira'),
('Terça-feira'),
('Quarta-feira'),
('Quinta-feira'),
('Sexta-feira'),
('Sábado');

INSERT INTO membro_dia (id_membro, id_dia) VALUES
(1,1),
(1,4),
(1,5),
(2,2),
(2,3),
(3,6),
(3,4),
(4,2),
(5,1),
(6,6),
(6,1),
(7,3),
(4,3),
(2,7),
(1,7),
(7,5);

INSERT INTO monitoramento (id_planta, data_revisao, tamanho_cm, id_membro_dia) VALUES
(1, '2025-07-05', 10, 1),   
(2, '2025-07-07', 4, 10),   
(3, '2025-07-10', 6, 11),   
(6, '2025-07-12', 7, 6),    
(5, '2025-07-15', 5, 8),   
(1, '2025-08-03', 18, 2),   
(2, '2025-08-06', 8, 13),  
(4, '2025-08-09', 12, 4),   
(7, '2025-08-15', 4, 12),   
(3, '2025-08-02', 12, 7),   
(1, '2025-09-07', 25, 3),   
(2, '2025-09-10', 12, 5),   
(6, '2025-09-11', 15, 6),   
(6, '2025-09-12', 15, 6),   
(2, '2025-09-09', 10, 10),  
(3, '2025-09-12', 18, 7),   
(5, '2025-09-10', 14, 14),  
(6, '2025-09-09', 17, 11),  
(7, '2025-09-12', 6, 13),   
(1, '2025-09-07', 27, 1),   
(5, '2025-09-11', 16, 14),
(1, '2025-10-20', 31, 1),
(2, '2025-10-21', 19, 5),
(3, '2025-10-22', 23, 7),
(4, '2025-10-23', 19, 4),
(5, '2025-10-24', 22, 14),
(6, '2025-10-25', 24, 6),
(7, '2025-10-26', 11, 13),
(1, '2025-09-23', 28, 1),
(2, '2025-09-25', 16, 5),
(3, '2025-09-26', 20, 7),
(4, '2025-09-28', 18, 4),
(5, '2025-09-29', 19, 14),
(6, '2025-10-01', 21, 6),
(7, '2025-10-02', 9, 13);  
