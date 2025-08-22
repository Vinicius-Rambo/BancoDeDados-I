CREATE DATABASE clube;

\c clube

CREATE TABLE alunos (
  id_aluno SERIAL PRIMARY KEY,
  nome_completo VARCHAR(80)  NOT NULL,
  email VARCHAR(80)  NOT NULL UNIQUE,   
  codigo_matricula VARCHAR(80) UNIQUE 
);

CREATE TABLE autores (
  id_autor SERIAL PRIMARY KEY,
  nome_completo TEXT NOT NULL,
  pais_origem TEXT
);

CREATE TABLE livros (
  id_livro SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  isbn TEXT UNIQUE, 
  ano_publicacao INT
);

CREATE TABLE livros_autores (
  id_livro INT NOT NULL REFERENCES livros(id_livro),
  id_autor INT NOT NULL REFERENCES autores(id_autor),
  PRIMARY KEY (id_livro, id_autor)
);

CREATE TABLE emprestimos (
  id_emprestimo SERIAL PRIMARY KEY,
  id_aluno  INT NOT NULL REFERENCES alunos(id_aluno),
  id_livro  INT NOT NULL REFERENCES livros(id_livro),
  data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
  data_devolucao  DATE 
);


-- Alunos
INSERT INTO alunos(nome_completo, email, codigo_matricula) VALUES
('Ana Ribeiro', 'ana.ribeiro@example.edu', 'MAT2025-001'),
('Bruno Costa', 'bruno.costa@example.edu', 'MAT2025-002'),
('Carla Mendes', 'carla.mendes@example.edu', 'MAT2025-003');


-- Autores
INSERT INTO autores (nome_completo, pais_origem) VALUES
('George Orwell', 'Reino Unido'),
('Aldous Huxley', 'Reino Unido'),
('Isaac Asimov', 'Estados Unidos');

-- Livros
INSERT INTO livros (titulo, isbn, ano_publicacao) VALUES
('1984', '9780451524935', 1949),
('Admirável Mundo Novo', '9780060850524', 1932),
('Eu, Robô', '9780553382563', 1950),
('A Fundação', '9780233382563', 195);

-- Mostra tudo
select * from alunos;
select * from livros;
select * from autores;

INSERT INTO livros_autores (id_livro, id_autor) VALUES (3,3), (4,3);
INSERT INTO livros_autores (id_livro, id_autor) VALUES (3,3), (4,3);

-- Comando meramente inlustrativo para ver tudo 

SELECT * FROM livros
INNER JOIN livros_autores USING (id_livro)
INNER JOIN Autores USING(id_autor);

-- Delete especifico

DELETE FROM livros_autores -- Nunca use ponto e virgula aqui deleta tudo.
WHERE id_livro = 4 AND id_autor = 1;

--Deleta
DELETE FROM livros WHERE id_livros = 2;

