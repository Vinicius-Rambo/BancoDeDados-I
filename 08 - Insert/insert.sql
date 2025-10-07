--Usando Banco da aula 7

-- Inserindo valores na disciplina.
INSERT INTO disciplina(nome) VALUES ('MATEMÁTICA');
INSERT INTO disciplina(nome) VALUES ('CIÊNCIAS');
INSERT INTO disciplina(nome) VALUES ('PORTUGUÊS');   
INSERT INTO disciplina(nome) VALUES ('GEOFRAFIA');   
INSERT INTO disciplina(nome) VALUES ('HISTORIA');   

-- Inserindo valores nas turmas.
INSERT INTO turma (ano, letra) VALUES (1, 'A') , (1, 'B'), (2, 'C');
INSERT INTO turma (ano, letra) VALUES (2, 'B');
INSERT INTO turma (ano, letra) VALUES (5, 'D');

-- Turma com erro de poder ficar reptido.
DELETE FROM turma; --Limpar a turma
ALTER TABLE turma ADD CONSTRAINT ano_letra UNIQUE (ano,letra) --modifica para ser unico.

-- Inserindo aluno

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('JOÃO DA SILVA', '2020-02-10', 'Rua Zero, 282 - 85893-46', 2025, 8);

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('MARIA DE SOUZA', '2020-05-22', 'Rua Um, 185 - 85893-828', 2025, 8);

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('JOÂO DE SOUZA', '2020-05-22', 'Rua Um, 185 - 85893-828', 2025, 8);

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('CLEISON DE PAZ', '2020-01-31', 'Rua Um, 185 - 85893-818', 2025, 8);

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('ADELSON MACHADO', '2020-01-31', 'Rua Um, 185 - 85893-818', 2025, 8);

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma) 
VALUES('Breno Adelson', '2018-12-27', 'Rua dois, 185 - 85893-818', 2025, 8);

-- Modificando um elemento.
UPDATE aluno SET nome = 'BRENO ADELSON' WHERE id_aluno = 14;

--Inserir professor.
INSERT INTO professor (nome) VALUES ('Felipe Scandido'), ('Gabriel Marques'), ('Júlio Cesar II'), ('Marcos Mion'), ('Cesar Menote');

--Inserir responsavel.
INSERT INTO responsavel (nome, telefone, celular, email) VALUES
('GREGORIO DA FONSECA', '1213-1234', '(45) 99988-7711','FONSECA.GREG@GMAIL.COM'),
('BERNARDO VIEIRA', '9898-9898', '(45) 89109-2999','VIEIRAZIN90@GMAIL.COM'),
('GETÚLIO VARGAS', '2408-1954', '(55) 91904-1882','GETULIO.PRESIDENTE@GOV.COM.BR'),
('JOANA DARC', '1412-1431', '(33) 91605-1920','REVOLUCIONARIA.FRANCA@CHURCH.COM'),
('JESSICA JUNG', '1804-1989', '(38) 2007-2014','GIRLS.JESS@NAVER.COM');

-- Ligar responsavel em aluno.
INSERT INTO aluno_responsavel (id_aluno, id_responsavel) VALUES
(9,3),
(10,5),
(11,5),
(12,4),
(13,1),
(14,2);

-- comando join aulas futuras
SELECT * FROM ALUNO JOIN aluno_responsavel USING (id_aluno) JOIN responsavel USING (id_responsavel);

SELECT * FROM disciplina join professor_disciplina_turma USING(id_disciplina) join professor USING (id_professor) join turma USING(id_turma);


-- Ligar disciplina-professor-turma;
INSERT INTO professor_disciplina_turma(id_professor, id_disciplina, id_turma) VALUES
(2,1,8),
(2,2,8),
(2,3,8),
(2,4,8),
(2,5,8);
