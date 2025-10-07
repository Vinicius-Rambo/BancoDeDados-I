-- Compradores
INSERT INTO comprador (nome_compr, cpf_compr, estado_civil, nome_conjuge, cpf_conjuge)
VALUES
    ('Pitágoras','12345678901','Solteiro',NULL,NULL),
    ('Sócrates','23456789012','Casado','Xantipa','56473829105'),
    ('Friedrich Nietzsche','34567890123','Divorciado',NULL,NULL),
    ('Herbert Spencer','45678901234','Solteiro',NULL,NULL),
    ('João Silva','56789012345','Casado','Maria Silva','17283940566'),
    ('Ana Oliveira','67890123456','Solteiro',NULL,NULL),
    ('Carlos Souza','78901234567','Divorciado',NULL,NULL),
    ('Karl Marx','89012345678','Viuvo',NULL,NULL),
    ('Charles Darwin','89012345212','Casado','Emma Darwin','90817263544');

--Corretores
INSERT INTO corretor (nome_corretor, matricula_corretor, admissao_corretor)
VALUES
  ('Charles Darwin','48392','1990-03-12'),
  ('Péricles Aparecido','17583','2005-07-20'),
  ('Roberto Carlos','29018','1989-11-05'),
  ('Tim Maia','56421','1998-06-15'),
  ('Michael Jackson','83729','2002-01-30');

-- MARCAS
INSERT INTO marca (nome_marca, cod_marca)
VALUES
  ('Volkswagen','VW'),
  ('Fiat','FI'),
  ('Chevrolet','CH'),
  ('Honda','HN'),
  ('Toyota','TO'),
  ('BYD','BY'),
  ('Ford','FD');

--Modelo
INSERT INTO modelo (cod_modelo, nome_modelo, id_marca)
VALUES
  ('VW071','Gol',1),
  ('FIUNO','Uno',2),
  ('CHONIX','Onix',3),
  ('HNCIVIC','Civic',4),
  ('TOCORO','Corolla',5),
  ('BYDHAN','Han EV',6),
  ('FDZERO','F-1000',7),
  ('KMKOMBI','Kombi',1);

  -- VEÍCULOS
INSERT INTO veiculo (num_chassi, num_placa, cor, ano_fabrica, quilometragem, id_modelo)
VALUES
  ('1HGBH41JXMN109001','ABC1D23','#ffdfdfff',2023,0,1),   
  ('2T1BURHE2FC123002','DEF2G45','#000000ff',2022,0,2),   
  ('3FAHP0HA6AR123003','GHI3J67','#ff0000ff',2020,15000,3), 
  ('4T1BF1FK0GU123004','JKL4M89','#6b6b6bff',2019,30000,4), 
  ('5YJSA1E26GF123005','MNO5P01','#d1a000ff',2021,5000,5), 
  ('JH4KA8270MC012006','PQR6S23','#3700ffff',2023,0,6),   
  ('WBA3A5C51CF123007','STU7V45','#751b00b9',1985,120000,7), 
  ('1FADP3F2XGL123008','VWX8Y67','#ffffffff',1978,250000,8);

-- VENDAS
INSERT INTO venda (valor_venda, data_venda, comissao_corretor, id_compr, id_corretor, id_veiculo)
VALUES
  (90000.00,'2023-06-01',9000.00,1,1,1),
  (50000.00,'2023-06-15',5000.00,2,2,2),
  (65000.00,'2023-07-01',6500.00,3,3,3),
  (80000.00,'2023-07-15',8000.00,4,4,4),
  (100000.00,'2023-08-01',10000.00,5,5,5),
  (120000.00,'2023-08-20',12000.00,6,1,6),
  (25000.00,'2023-09-05',2500.00,7,2,7),
  (15000.00,'2023-09-10',1500.00,8,3,8),
  (70000.00,'2023-09-15',7000.00,9,4,1),
  (55000.00,'2023-09-20',5500.00,1,5,2);
