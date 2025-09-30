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
('Couve', 'Brassica oleracea'),
('Cenoura', 'Daucus carota'),
('Alface', 'Lactuca sativa'),
('Batata', 'Solanum tuberosum'),
('Beterraba', 'Beta vulgaris'),
('Tomate', 'Solanum lycopersicum'),
('Rabanete', 'Raphanus sativus');

INSERT INTO planta (id_nome, id_solo, id_setor) VALUES
(1,1,1),
(2,2,3),
(3,3,1),
(4,3,1),
(5,1,4),
(6,5,2),
(2,6,2),
(1,2,4),
(5,1,3);

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
(4,2),
(5,1),
(6,6),
(6,1),
(7,3),
(7,5);

INSERT INTO monitoramento (id_planta, data_revisao, tamanho_cm, id_membro) VALUES
(1, '2025-07-05', 10, 1), 
(2, '2025-07-07', 4, 5),
(3, '2025-07-10', 6, 6),
(6, '2025-07-12', 7, 10),
(5, '2025-07-15', 5, 14),
(1, '2025-08-03', 18, 4),
(2, '2025-08-06', 8, 13),
(4, '2025-08-09', 12, 8),
(7, '2025-08-15', 4, 11),
(3, '2025-08-02', 12, 7),
(1, '2025-09-07', 25, 1),
(2, '2025-09-10', 12, 2),
(6, '2025-09-11', 15, 3),
(6, '2025-09-11', 15, 3),
(2, '2025-09-09', 10, 5),
(3, '2025-09-12', 18, 6),
(5, '2025-09-10', 14, 7),
(6, '2025-09-09', 17, 10),
(7, '2025-09-12', 6, 11),
(1, '2025-09-07', 27, 12),
(5, '2025-09-11', 16, 14);
