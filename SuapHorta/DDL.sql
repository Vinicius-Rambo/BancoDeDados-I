CREATE DATABASE horta;
\c horta; 

CREATE TABLE setor 
( 
 id_setor SERIAL PRIMARY KEY,  
 Local VARCHAR(80) NOT NULL  
); 

CREATE TABLE solo 
( 
 id_solo SERIAL PRIMARY KEY,  
 tipo_solo VARCHAR(80),  
 caracteristicas TEXT NOT NULL  
); 

CREATE TABLE nome_planta 
( 
 id_nome SERIAL PRIMARY KEY,  
 nome_planta VARCHAR(80) NOT NULL,  
 nome_cientifico VARCHAR(80) NOT NULL  
); 

CREATE TABLE planta 
( 
 id_planta SERIAL PRIMARY KEY,  
 id_nome INT NOT NULL REFERENCES nome_planta(id_nome),  
 id_solo INT NOT NULL REFERENCES solo(id_solo), 
 id_setor INT NOT NULL REFERENCES setor(id_setor) 
); 

CREATE TABLE membro 
( 
 id_membro SERIAL PRIMARY KEY,  
 nome_membro VARCHAR(80) NOT NULL,  
 matricula_membro INT NOT NULL,  
 curso_membro VARCHAR(80) NOT NULL,  
 ano_faculdade INT NOT NULL 
); 

CREATE TABLE dia_Visita 
( 
 id_dia SERIAL PRIMARY KEY,  
 nome_dia VARCHAR(14) NOT NULL --Maior nome de dia "Segunda-feira"  
); 

--Relação M:N entre membro e dia
CREATE TABLE membro_dia 
( 
 id_membro INT NOT NULL REFERENCES membro(id_membro),  
 id_dia INT NOT NULL REFERENCES dia_Visita(id_dia),
 id_membro_dia SERIAL PRIMARY KEY --Poderia ser chave composta
); 

CREATE TABLE monitoramento (
  id_monitoramento SERIAL PRIMARY KEY,
  id_planta INT NOT NULL REFERENCES planta(id_planta),
  data_revisao DATE NOT NULL,
  tamanho_cm INT NOT NULL,
  id_membro_dia INT NOT NULL REFERENCES membro_dia(id_membro_dia)
);


