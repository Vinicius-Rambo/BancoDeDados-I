CREATE TABLE Aluno 
( 
 id_aluno: INT,  
 Nome_Completo INT,  
 E-mail INT,  
 Código_Matricula INT,  
); 

CREATE TABLE Autor 
( 
 País_origem VARCHAR(n),  
 Nome_completo VARCHAR(n),  
 id_autor INT,  
); 

CREATE TABLE livro 
( 
 id_livro: INT,  
 Titulo VARCHAR(n),  
 isbn VARCHAR(n),  
 Ano_publicação INT,  
 id_emprestimos INT,  
); 

CREATE TABLE Emprestimos 
( 
 id_empréstimo INT,  
 Data_empréstimo INT,  
 Data_devolução INT,  
 id_livro INT,  
 id_aluno INT,  
); 

CREATE TABLE Livro_Autor 
( 
 id_autor: INT,  
 id_livro: INT,  
 id_autor INT PRIMARY KEY,  
 id_livro INT PRIMARY KEY,  
); 

ALTER TABLE livro ADD FOREIGN KEY(id_emprestimos) REFERENCES Emprestimos (id_emprestimos)
ALTER TABLE Emprestimos ADD FOREIGN KEY(id_aluno) REFERENCES Aluno (id_aluno)
ALTER TABLE Livro_Autor ADD FOREIGN KEY(id_autor) REFERENCES Autor (id_autor)
ALTER TABLE Livro_Autor ADD FOREIGN KEY(id_livro) REFERENCES livro (id_livro)