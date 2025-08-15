CREATE DATABASE lojaif;

\c lo

CREATE TABLE produto (id_prod INT PRIMARY KEY, descricao VARCHAR(255) 
NOT NULL, preco DECIMAL (12, 2), estoque INT); */

CREATE TABLE produto( id SERIAL PRIMARY KEY, descricao VARCHAR(100), email VARCHAR(100));

\dt 

\d produto

ALTER TABLE produto DROP COLUMN email;

ALTER TABLE produto ADD COLUMN categoria VARCHAR(100);  

ALTER TABLE produto RENAME TO item;

ALTER SEQUENCE produto_id_seq RENAME TO item_id_seq;

DROP TABLE item;