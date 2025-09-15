CREATE DATABASE concessionaria;
\c concessionaria;

CREATE TABLE comprador( 
 id_compr SERIAL PRIMARY KEY,  
 nome_compr VARCHAR(80) NOT NULL,  
 cpf_compr VARCHAR(11) NOT NULL,  -- Formatação xxx.xxx.xxx-xx "possui 11"
 estado_civil VARCHAR(11) NOT NULL,  
 nome_conjuge VARCHAR(80),  
 cpf_conjuge VARCHAR(11)  
); 

CREATE TABLE corretor ( 
 id_corretor SERIAL PRIMARY KEY,  
 matricula_corretor VARCHAR(80) NOT NULL,  
 nome_corretor VARCHAR(80) NOT NULL,  
 admissao_corretor DATE NOT NULL 
); 

CREATE TABLE marca ( 
 id_marca SERIAL PRIMARY KEY,  
 cod_marca VARCHAR(80) NOT NULL,  
 nome_marca VARCHAR(80) NOT NULL
); 

CREATE TABLE modelo( 
 id_modelo SERIAL PRIMARY KEY,  
 cod_modelo VARCHAR(80) NOT NULL,  
 nome_modelo VARCHAR(80) NOT NULL,  
 id_marca INT NOT NULL REFERENCES marca(id_marca) --Chave estrangeira de marca.  
); 

CREATE TABLE veiculo ( 
 id_veiculo SERIAL PRIMARY KEY,
 num_chassi VARCHAR(17) NOT NULL, --Por norma 17 caracteres  
 num_placa VARCHAR(7) NOT NULL, --Padrão mercosul de placas 
 cor VARCHAR(20) NOT NULL,  
 ano_fabrica INT NOT NULL CHECK (ano_fabrica >= 1900), --Carros mais recentes que 1900  
 quilometragem INT NOT NULL CHECK (quilometragem >= 0), --Quilometragem maior do que 0  
 id_modelo INT NOT NULL REFERENCES modelo(id_modelo) --Chave estrangeira de modelo  
); 

CREATE TABLE venda ( 
 id_venda SERIAL PRIMARY KEY,  
 valor_venda FLOAT NOT NULL,  
 data_venda DATE NOT NULL,  
 comissao_corretor FLOAT NOT NULL, -- Por porcentagem seria interressante  
 id_compr INT NOT NULL REFERENCES comprador(id_compr),  
 id_corretor INT NOT NULL REFERENCES corretor(id_corretor),
 id_veiculo INT NOT NULL REFERENCES veiculo(id_veiculo)
); 






