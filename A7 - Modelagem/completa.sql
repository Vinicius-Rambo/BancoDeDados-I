CREATE TABLE turma 
( 
 id_turma SERIAL PRIMARY KEY,  
 ano INT NOT NULL CHECK (ano >= 1 AND ano <= 5),  
 letra CHAR(1) NOT NULL CHECK (letra IN ('A', 'B', 'C', 'D', 'E')) 
); 

CREATE TABLE aluno 
( 
 id_aluno SERIAL PRIMARY KEY ,  
 nome VARCHAR(80) NOT NULL,  
 data_nascimento DATE NOT NULL,  
 endereco TEXT,  
 ano_letivo INT NOT NULL CHECK (ano_letivo >= 2025 AND ano_letivo <= 2100),  
 id_turma INT NOT NULL REFERENCES turma (id_turma)
 
); 


CREATE TABLE disciplina 
( 
 id_disciplina SERIAL PRIMARY KEY, 
 nome VARCHAR(80) NOT NULL  
); 


CREATE TABLE historico 
( 
 id_aluno INT NOT NULL  REFERENCES aluno (id_aluno),  
 id_disciplina INT NOT NULL REFERENCES disciplina (id_disciplina),
 ano_letivo INT NOT NULL CHECK (ano_letivo >= 2025 AND ano_letivo <= 2100), 
 nota INT NOT NULL CHECK (nota >= 0 AND nota <= 100), 
 faltas INT DEFAULT 0 
); 

CREATE TABLE professor 
( 
 id_professor SERIAL PRIMARY KEY,     
 nome VARCHAR(80) NOT NULL 
); 

CREATE TABLE professor_disciplina_turma 
( 
 id_disciplina INT NOT NULL REFERENCES disciplina (id_disciplina),  
 id_professor INT NOT NULL REFERENCES professor (id_professor),   
 id_turma INT NOT NULL REFERENCES turma (id_turma),
 PRIMARY KEY (id_disciplina, id_professor, id_turma)
); 

CREATE TABLE responsavel 
( 
 id_responsavel SERIAL PRIMARY KEY ,  
 nome VARCHAR(80) NOT NULL,  
 telefone VARCHAR(21) NOT NULL,  
 celular VARCHAR(21) NOT NULL,  
 email VARCHAR(255) NOT NULL  
); 

CREATE TABLE aluno_responsavel 
( 
 id_aluno INT NOT NULL REFERENCES aluno (id_aluno),  
 id_responsavel  INT NOT NULL REFERENCES responsavel (id_responsavel),  
 PRIMARY KEY (id_aluno, id_responsavel)
); 


