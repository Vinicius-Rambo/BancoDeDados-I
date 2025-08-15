/*Usando o mesmo banco da atv1*/

CREATE TABLE produto(id_prod SERIAL PRIMARY KEY, descricao VARCHAR(255) NOT 
NULL, preco DECIMAL(12,2), estoque INT);

/*Insere Descrição, preço e estoque nesta ordem*/
INSERT INTO produto (descricao, preco, estoque)
VALUES ('Notebook', 2500.00, 10);

INSERT INTO produto (descricao, preco, estoque)
VALUES ('Mouse', 50.00, 100);

INSERT INTO produto (descricao, preco, estoque)
VALUES ('Teclado', 150.00, 50);

/*Mostra os instens da coluna de uma tabela*/
SELECT descricao FROM produto;

/*Mostra todos que tem interno "*" mostra todos.*/
SELECT descricao, preco, estoque FROM produto;
SELECT * FROM produto;