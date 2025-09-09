--Base de Dados - escolaif

CREATE DATABASE escolaif;

CREATE TABLE turma ( 
 id_turma SERIAL PRIMARY KEY,  
 ano INT NOT NULL CHECK (ano >= 1 AND ano <= 5),  
 letra CHAR(1) NOT NULL CHECK (letra IN ('A', 'B', 'C', 'D', 'E'))  
);

CREATE TABLE aluno (
 id_aluno SERIAL PRIMARY KEY,  
 nome VARCHAR(80) NOT NULL,  
 data_nascimento DATE NOT NULL,
 endereco TEXT,
 ano_letivo INT NOT NULL CHECK (ano_letivo >= 2025 AND ano_letivo < 2100),
 id_turma INT NOT NULL REFERENCES turma (id_turma)
); 

CREATE TABLE disciplina ( 
 id_disciplina SERIAL PRIMARY KEY,  
 nome VARCHAR(80) NOT NULL
); 

CREATE TABLE historico ( 
 id_aluno INT NOT NULL,  
 id_disciplina INT NOT NULL REFERENCES disciplina (id_disciplina),  
 ano_letivo INT NOT NULL CHECK (ano_letivo >= 2025 AND ano_letivo < 2100),
 nota INT NOT NULL CHECK (nota >= 0 AND nota <= 100),  
 faltas INT DEFAULT 0  
); 

CREATE TABLE professor ( 
 id_professor SERIAL PRIMARY KEY,  
 nome VARCHAR(80) NOT NULL  
); 

CREATE TABLE prof_disc_turma ( 
 id_professor INT NOT NULL REFERENCES professor(id_professor),  
 id_disciplina INT NOT NULL REFERENCES disciplina(id_disciplina),  
 id_turma INT NOT NULL REFERENCES turma(id_turma), 
 PRIMARY KEY (id_professor, id_disciplina, id_turma)
); 

CREATE TABLE responsavel ( 
 id_responsavel SERIAL PRIMARY KEY, 
 nome VARCHAR(80) NOT NULL,  
 telefone VARCHAR(21) NOT NULL,  
 celular VARCHAR(21) NOT NULL,  
 email VARCHAR(255) NOT NULL  
); 

CREATE TABLE aluno_responsavel ( 
 id_aluno INT NOT NULL REFERENCES aluno(id_aluno),  
 id_responsavel INT NOT NULL REFERENCES responsavel(id_responsavel),
 PRIMARY KEY(id_aluno, id_responsavel) 
); 

INSERT INTO turma (ano, letra) VALUES
  (2, 'A'),
  (3, 'B'),
  (4, 'C'),
  (5, 'D');

INSERT INTO disciplina (nome) VALUES
  ('Matemática'),
  ('Português'),
  ('Ciências');

INSERT INTO professor (nome) VALUES
  ('Ana Paula Almeida'),
  ('Bruno Ferreira'),
  ('Carla Menezes'),
  ('Diego Carvalho'),
  ('Elaine Rocha'),
  ('Fábio Monteiro'),
  ('Gabriela Nunes'),
  ('Henrique Barros'),
  ('Isabela Martins'),
  ('João Vitor Campos'),
  ('Karen Duarte'),
  ('Lucas Pacheco');

INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Ana Paula Almeida' AND d.nome = 'Matemática' AND t.ano = 2 AND t.letra = 'A';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Bruno Ferreira' AND d.nome = 'Português' AND t.ano = 2 AND t.letra = 'A';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Carla Menezes' AND d.nome = 'Ciências' AND t.ano = 2 AND t.letra = 'A';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Diego Carvalho' AND d.nome = 'Matemática' AND t.ano = 3 AND t.letra = 'B';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Elaine Rocha' AND d.nome = 'Português' AND t.ano = 3 AND t.letra = 'B';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Fábio Monteiro' AND d.nome = 'Ciências' AND t.ano = 3 AND t.letra = 'B';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Gabriela Nunes' AND d.nome = 'Matemática' AND t.ano = 4 AND t.letra = 'C';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Henrique Barros' AND d.nome = 'Português' AND t.ano = 4 AND t.letra = 'C';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Isabela Martins' AND d.nome = 'Ciências' AND t.ano = 4 AND t.letra = 'C';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'João Vitor Campos' AND d.nome = 'Matemática' AND t.ano = 5 AND t.letra = 'D';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Karen Duarte' AND d.nome = 'Português' AND t.ano = 5 AND t.letra = 'D';
INSERT INTO prof_disc_turma (id_professor, id_disciplina, id_turma)
SELECT p.id_professor, d.id_disciplina, t.id_turma
FROM professor p, disciplina d, turma t
WHERE p.nome = 'Lucas Pacheco' AND d.nome = 'Ciências' AND t.ano = 5 AND t.letra = 'D';

INSERT INTO responsavel (nome, telefone, celular, email) VALUES
  ('Jorge Batista Cunha', '(45) 37037-1053', '(45) 98029-1071', 'jorge.batista.cunha.001@exemplo.com'),
  ('Viviane Moreira Reis', '(45) 37074-1106', '(45) 98058-1142', 'viviane.moreira.reis.002@exemplo.com'),
  ('Daniela Barbosa Batista', '(45) 37111-1159', '(45) 98087-1213', 'daniela.barbosa.batista.003@exemplo.com'),
  ('Jorge Teixeira Rocha', '(45) 37148-1212', '(45) 98116-1284', 'jorge.teixeira.rocha.004@exemplo.com'),
  ('Guilherme Barcelos Cardoso', '(45) 37185-1265', '(45) 98145-1355', 'guilherme.barcelos.cardoso.005@exemplo.com'),
  ('Viviane Reis Silva', '(45) 37222-1318', '(45) 98174-1426', 'viviane.reis.silva.006@exemplo.com'),
  ('Renata Moreira Barros', '(45) 37259-1371', '(45) 98203-1497', 'renata.moreira.barros.007@exemplo.com'),
  ('Alexandre Queiroz Assis', '(45) 37296-1424', '(45) 98232-1568', 'alexandre.queiroz.assis.008@exemplo.com'),
  ('Jair Cunha Pires', '(45) 37333-1477', '(45) 98261-1639', 'jair.cunha.pires.009@exemplo.com'),
  ('Aloísio Monteiro Barros', '(45) 37370-1530', '(45) 98290-1710', 'aloisio.monteiro.barros.010@exemplo.com'),
  ('César Nunes Martins', '(45) 37407-1583', '(45) 98319-1781', 'cesar.nunes.martins.011@exemplo.com'),
  ('Jorge Lima Moreira', '(45) 37444-1636', '(45) 98348-1852', 'jorge.lima.moreira.012@exemplo.com'),
  ('César Machado Nascimento', '(45) 37481-1689', '(45) 98377-1923', 'cesar.machado.nascimento.013@exemplo.com'),
  ('Cátia Melo Cardoso', '(45) 37518-1742', '(45) 98406-1994', 'catia.melo.cardoso.014@exemplo.com'),
  ('Karina Barbosa Gomes', '(45) 37555-1795', '(45) 98435-2065', 'karina.barbosa.gomes.015@exemplo.com'),
  ('Alessandra Oliveira Melo', '(45) 37592-1848', '(45) 98464-2136', 'alessandra.oliveira.melo.016@exemplo.com'),
  ('Bruno Machado Pereira', '(45) 37629-1901', '(45) 98493-2207', 'bruno.machado.pereira.017@exemplo.com'),
  ('Antônio Batista Barcelos', '(45) 37666-1954', '(45) 98522-2278', 'antonio.batista.barcelos.018@exemplo.com'),
  ('Gisele Teixeira Campos', '(45) 37703-2007', '(45) 98551-2349', 'gisele.teixeira.campos.019@exemplo.com'),
  ('Viviane Melo Gomes', '(45) 37740-2060', '(45) 98580-2420', 'viviane.melo.gomes.020@exemplo.com'),
  ('Jair Silva Carvalho', '(45) 37777-2113', '(45) 98609-2491', 'jair.silva.carvalho.021@exemplo.com'),
  ('Rafael Vieira Ribeiro', '(45) 37814-2166', '(45) 98638-2562', 'rafael.vieira.ribeiro.022@exemplo.com'),
  ('Fátima Moura Pires', '(45) 37851-2219', '(45) 98667-2633', 'fatima.moura.pires.023@exemplo.com'),
  ('Ângela Reis Melo', '(45) 37888-2272', '(45) 98696-2704', 'angela.reis.melo.024@exemplo.com'),
  ('Cristina Pires Almeida', '(45) 37925-2325', '(45) 98725-2775', 'cristina.pires.almeida.025@exemplo.com'),
  ('Rodrigo Pires Moura', '(45) 37962-2378', '(45) 98754-2846', 'rodrigo.pires.moura.026@exemplo.com'),
  ('Eduardo Assis Cunha', '(45) 37999-2431', '(45) 98783-2917', 'eduardo.assis.cunha.027@exemplo.com'),
  ('Paulo Monteiro Machado', '(45) 38036-2484', '(45) 98812-2988', 'paulo.monteiro.machado.028@exemplo.com'),
  ('Marcos Duarte Vieira', '(45) 38073-2537', '(45) 98841-3059', 'marcos.duarte.vieira.029@exemplo.com'),
  ('Eduardo Monteiro Martins', '(45) 38110-2590', '(45) 98870-3130', 'eduardo.monteiro.martins.030@exemplo.com'),
  ('Maurício Nunes Monteiro', '(45) 38147-2643', '(45) 98899-3201', 'mauricio.nunes.monteiro.031@exemplo.com'),
  ('Luciana Melo Araújo', '(45) 38184-2696', '(45) 98928-3272', 'luciana.melo.araujo.032@exemplo.com'),
  ('Rafael Moura Campos', '(45) 38221-2749', '(45) 98957-3343', 'rafael.moura.campos.033@exemplo.com'),
  ('Hugo Melo Araújo', '(45) 38258-2802', '(45) 98986-3414', 'hugo.melo.araujo.034@exemplo.com'),
  ('Aloísio Pereira Moreira', '(45) 38295-2855', '(45) 99015-3485', 'aloisio.pereira.moreira.035@exemplo.com'),
  ('Lidiane Araújo Nascimento', '(45) 38332-2908', '(45) 99044-3556', 'lidiane.araujo.nascimento.036@exemplo.com'),
  ('Roberta Ramos Lima', '(45) 38369-2961', '(45) 99073-3627', 'roberta.ramos.lima.037@exemplo.com'),
  ('Daniela Gomes Ribeiro', '(45) 38406-3014', '(45) 99102-3698', 'daniela.gomes.ribeiro.038@exemplo.com'),
  ('Vanessa Gomes Barros', '(45) 38443-3067', '(45) 99131-3769', 'vanessa.gomes.barros.039@exemplo.com'),
  ('Bárbara Batista Nascimento', '(45) 38480-3120', '(45) 99160-3840', 'barbara.batista.nascimento.040@exemplo.com');
INSERT INTO responsavel (nome, telefone, celular, email) VALUES
  ('Daniel Pires Batista', '(45) 38517-3173', '(45) 99189-3911', 'daniel.pires.batista.041@exemplo.com'),
  ('Ângela Barros Batista', '(45) 38554-3226', '(45) 99218-3982', 'angela.barros.batista.042@exemplo.com'),
  ('Vanessa Queiroz Santos', '(45) 38591-3279', '(45) 99247-4053', 'vanessa.queiroz.santos.043@exemplo.com'),
  ('Paulo Barcelos Teixeira', '(45) 38628-3332', '(45) 99276-4124', 'paulo.barcelos.teixeira.044@exemplo.com'),
  ('Bruno Silva Pinto', '(45) 38665-3385', '(45) 99305-4195', 'bruno.silva.pinto.045@exemplo.com'),
  ('Renata Teixeira Batista', '(45) 38702-3438', '(45) 99334-4266', 'renata.teixeira.batista.046@exemplo.com'),
  ('Daniel Ramos Assis', '(45) 38739-3491', '(45) 99363-4337', 'daniel.ramos.assis.047@exemplo.com'),
  ('Karina Campos Ribeiro', '(45) 38776-3544', '(45) 99392-4408', 'karina.campos.ribeiro.048@exemplo.com'),
  ('Márcia Vieira Campos', '(45) 38813-3597', '(45) 99421-4479', 'marcia.vieira.campos.049@exemplo.com'),
  ('Alessandra Teixeira Nascimento', '(45) 38850-3650', '(45) 99450-4550', 'alessandra.teixeira.nascimento.050@exemplo.com'),
  ('Jorge Correia Martins', '(45) 38887-3703', '(45) 99479-4621', 'jorge.correia.martins.051@exemplo.com'),
  ('Antônio Almeida Machado', '(45) 38924-3756', '(45) 99508-4692', 'antonio.almeida.machado.052@exemplo.com'),
  ('Daniel Santos Correia', '(45) 38961-3809', '(45) 99537-4763', 'daniel.santos.correia.053@exemplo.com'),
  ('Fernando Barcelos Santos', '(45) 38998-3862', '(45) 99566-4834', 'fernando.barcelos.santos.054@exemplo.com'),
  ('Cátia Vieira Almeida', '(45) 39035-3915', '(45) 99595-4905', 'catia.vieira.almeida.055@exemplo.com'),
  ('Antônio Rocha Souza', '(45) 39072-3968', '(45) 99624-4976', 'antonio.rocha.souza.056@exemplo.com'),
  ('Luciana Teixeira Cunha', '(45) 39109-4021', '(45) 99653-5047', 'luciana.teixeira.cunha.057@exemplo.com'),
  ('Janaína Pires Cunha', '(45) 39146-4074', '(45) 99682-5118', 'janaina.pires.cunha.058@exemplo.com'),
  ('Simone Teixeira Araújo', '(45) 39183-4127', '(45) 99711-5189', 'simone.teixeira.araujo.059@exemplo.com'),
  ('Paulo Batista Costa', '(45) 39220-4180', '(45) 99740-5260', 'paulo.batista.costa.060@exemplo.com'),
  ('Cátia Nunes Santos', '(45) 39257-4233', '(45) 99769-5331', 'catia.nunes.santos.061@exemplo.com'),
  ('Maurício Ramos Souza', '(45) 39294-4286', '(45) 99798-5402', 'mauricio.ramos.souza.062@exemplo.com'),
  ('Talita Ribeiro Pereira', '(45) 39331-4339', '(45) 99827-5473', 'talita.ribeiro.pereira.063@exemplo.com'),
  ('Rafael Oliveira Santos', '(45) 39368-4392', '(45) 99856-5544', 'rafael.oliveira.santos.064@exemplo.com'),
  ('Lidiane Barbosa Santos', '(45) 39405-4445', '(45) 99885-5615', 'lidiane.barbosa.santos.065@exemplo.com'),
  ('Guilherme Gomes Melo', '(45) 39442-4498', '(45) 99914-5686', 'guilherme.gomes.melo.066@exemplo.com'),
  ('Daniela Nunes Ferreira', '(45) 39479-4551', '(45) 99943-5757', 'daniela.nunes.ferreira.067@exemplo.com'),
  ('Fábio Barros Pires', '(45) 39516-4604', '(45) 99972-5828', 'fabio.barros.pires.068@exemplo.com'),
  ('Luiz Costa Dias', '(45) 39553-4657', '(45) 98001-5899', 'luiz.costa.dias.069@exemplo.com'),
  ('Eliane Assis Ferreira', '(45) 39590-4710', '(45) 98030-5970', 'eliane.assis.ferreira.070@exemplo.com'),
  ('Rafael Martins Cardoso', '(45) 39627-4763', '(45) 98059-6041', 'rafael.martins.cardoso.071@exemplo.com'),
  ('Cláudia Queiroz Santos', '(45) 39664-4816', '(45) 98088-6112', 'claudia.queiroz.santos.072@exemplo.com'),
  ('Renata Barcelos Teixeira', '(45) 39701-4869', '(45) 98117-6183', 'renata.barcelos.teixeira.073@exemplo.com'),
  ('Viviane Barbosa Pereira', '(45) 39738-4922', '(45) 98146-6254', 'viviane.barbosa.pereira.074@exemplo.com'),
  ('Fernando Melo Carvalho', '(45) 39775-4975', '(45) 98175-6325', 'fernando.melo.carvalho.075@exemplo.com'),
  ('Luiz Cardoso Assis', '(45) 39812-5028', '(45) 98204-6396', 'luiz.cardoso.assis.076@exemplo.com'),
  ('Rodrigo Ferreira Barcelos', '(45) 39849-5081', '(45) 98233-6467', 'rodrigo.ferreira.barcelos.077@exemplo.com'),
  ('Ricardo Oliveira Pinto', '(45) 39886-5134', '(45) 98262-6538', 'ricardo.oliveira.pinto.078@exemplo.com'),
  ('Daniel Vieira Dias', '(45) 39923-5187', '(45) 98291-6609', 'daniel.vieira.dias.079@exemplo.com'),
  ('Bárbara Duarte Nascimento', '(45) 39960-5240', '(45) 98320-6680', 'barbara.duarte.nascimento.080@exemplo.com');
INSERT INTO responsavel (nome, telefone, celular, email) VALUES
  ('Adriana Batista Campos', '(45) 39997-5293', '(45) 98349-6751', 'adriana.batista.campos.081@exemplo.com'),
  ('Cláudia Vieira Dias', '(45) 37034-5346', '(45) 98378-6822', 'claudia.vieira.dias.082@exemplo.com'),
  ('Hugo Pires Gomes', '(45) 37071-5399', '(45) 98407-6893', 'hugo.pires.gomes.083@exemplo.com'),
  ('Alexandre Rocha Moura', '(45) 37108-5452', '(45) 98436-6964', 'alexandre.rocha.moura.084@exemplo.com'),
  ('Jair Araújo Machado', '(45) 37145-5505', '(45) 98465-7035', 'jair.araujo.machado.085@exemplo.com'),
  ('Rodrigo Ramos Nunes', '(45) 37182-5558', '(45) 98494-7106', 'rodrigo.ramos.nunes.086@exemplo.com'),
  ('Antônio Vieira Queiroz', '(45) 37219-5611', '(45) 98523-7177', 'antonio.vieira.queiroz.087@exemplo.com'),
  ('Márcia Cunha Melo', '(45) 37256-5664', '(45) 98552-7248', 'marcia.cunha.melo.088@exemplo.com'),
  ('Cátia Araújo Monteiro', '(45) 37293-5717', '(45) 98581-7319', 'catia.araujo.monteiro.089@exemplo.com'),
  ('Lidiane Pires Barcelos', '(45) 37330-5770', '(45) 98610-7390', 'lidiane.pires.barcelos.090@exemplo.com'),
  ('Guilherme Teixeira Nascimento', '(45) 37367-5823', '(45) 98639-7461', 'guilherme.teixeira.nascimento.091@exemplo.com'),
  ('Alessandra Campos Cunha', '(45) 37404-5876', '(45) 98668-7532', 'alessandra.campos.cunha.092@exemplo.com'),
  ('Fátima Campos Barros', '(45) 37441-5929', '(45) 98697-7603', 'fatima.campos.barros.093@exemplo.com'),
  ('Talita Costa Nascimento', '(45) 37478-5982', '(45) 98726-7674', 'talita.costa.nascimento.094@exemplo.com'),
  ('Márcia Assis Araújo', '(45) 37515-6035', '(45) 98755-7745', 'marcia.assis.araujo.095@exemplo.com'),
  ('Eduardo Silva Moura', '(45) 37552-6088', '(45) 98784-7816', 'eduardo.silva.moura.096@exemplo.com'),
  ('Gisele Lima Melo', '(45) 37589-6141', '(45) 98813-7887', 'gisele.lima.melo.097@exemplo.com'),
  ('Marcos Batista Campos', '(45) 37626-6194', '(45) 98842-7958', 'marcos.batista.campos.098@exemplo.com'),
  ('Eduardo Melo Nunes', '(45) 37663-6247', '(45) 98871-8029', 'eduardo.melo.nunes.099@exemplo.com'),
  ('Jair Campos Monteiro', '(45) 37700-6300', '(45) 98900-8100', 'jair.campos.monteiro.100@exemplo.com'),
  ('Ricardo Santos Lima', '(45) 37737-6353', '(45) 98929-8171', 'ricardo.santos.lima.101@exemplo.com'),
  ('Michele Ribeiro Correia', '(45) 37774-6406', '(45) 98958-8242', 'michele.ribeiro.correia.102@exemplo.com'),
  ('Luiz Melo Cardoso', '(45) 37811-6459', '(45) 98987-8313', 'luiz.melo.cardoso.103@exemplo.com'),
  ('Jorge Queiroz Dias', '(45) 37848-6512', '(45) 99016-8384', 'jorge.queiroz.dias.104@exemplo.com'),
  ('Bruno Reis Moura', '(45) 37885-6565', '(45) 99045-8455', 'bruno.reis.moura.105@exemplo.com'),
  ('Talita Vieira Reis', '(45) 37922-6618', '(45) 99074-8526', 'talita.vieira.reis.106@exemplo.com'),
  ('Simone Pinto Pires', '(45) 37959-6671', '(45) 99103-8597', 'simone.pinto.pires.107@exemplo.com'),
  ('Márcia Cardoso Costa', '(45) 37996-6724', '(45) 99132-8668', 'marcia.cardoso.costa.108@exemplo.com'),
  ('Karina Ferreira Barbosa', '(45) 38033-6777', '(45) 99161-8739', 'karina.ferreira.barbosa.109@exemplo.com'),
  ('Roberta Ferreira Ramos', '(45) 38070-6830', '(45) 99190-8810', 'roberta.ferreira.ramos.110@exemplo.com'),
  ('Paulo Rocha Barbosa', '(45) 38107-6883', '(45) 99219-8881', 'paulo.rocha.barbosa.111@exemplo.com'),
  ('Janaína Nunes Araújo', '(45) 38144-6936', '(45) 99248-8952', 'janaina.nunes.araujo.112@exemplo.com'),
  ('Marcos Queiroz Moura', '(45) 38181-6989', '(45) 99277-9023', 'marcos.queiroz.moura.113@exemplo.com'),
  ('Flávio Moreira Carvalho', '(45) 38218-7042', '(45) 99306-9094', 'flavio.moreira.carvalho.114@exemplo.com'),
  ('Gisele Moreira Ribeiro', '(45) 38255-7095', '(45) 99335-9165', 'gisele.moreira.ribeiro.115@exemplo.com'),
  ('Tatiana Rocha Cardoso', '(45) 38292-7148', '(45) 99364-9236', 'tatiana.rocha.cardoso.116@exemplo.com'),
  ('Adriana Ramos Almeida', '(45) 38329-7201', '(45) 99393-9307', 'adriana.ramos.almeida.117@exemplo.com'),
  ('Márcia Oliveira Souza', '(45) 38366-7254', '(45) 99422-9378', 'marcia.oliveira.souza.118@exemplo.com'),
  ('Eduardo Moreira Almeida', '(45) 38403-7307', '(45) 99451-9449', 'eduardo.moreira.almeida.119@exemplo.com'),
  ('Hugo Campos Carvalho', '(45) 38440-7360', '(45) 99480-9520', 'hugo.campos.carvalho.120@exemplo.com');
INSERT INTO responsavel (nome, telefone, celular, email) VALUES
  ('Adriana Barcelos Moreira', '(45) 38477-7413', '(45) 99509-9591', 'adriana.barcelos.moreira.121@exemplo.com'),
  ('Bruno Nunes Monteiro', '(45) 38514-7466', '(45) 99538-9662', 'bruno.nunes.monteiro.122@exemplo.com'),
  ('Simone Rocha Souza', '(45) 38551-7519', '(45) 99567-9733', 'simone.rocha.souza.123@exemplo.com'),
  ('Luciana Nunes Ferreira', '(45) 38588-7572', '(45) 99596-9804', 'luciana.nunes.ferreira.124@exemplo.com'),
  ('Bárbara Correia Campos', '(45) 38625-7625', '(45) 99625-9875', 'barbara.correia.campos.125@exemplo.com'),
  ('Bárbara Barcelos Souza', '(45) 38662-7678', '(45) 99654-9946', 'barbara.barcelos.souza.126@exemplo.com'),
  ('Denise Gomes Barcelos', '(45) 38699-7731', '(45) 99683-1017', 'denise.gomes.barcelos.127@exemplo.com'),
  ('Renata Lima Melo', '(45) 38736-7784', '(45) 99712-1088', 'renata.lima.melo.128@exemplo.com'),
  ('Cristina Reis Batista', '(45) 38773-7837', '(45) 99741-1159', 'cristina.reis.batista.129@exemplo.com'),
  ('Flávio Assis Machado', '(45) 38810-7890', '(45) 99770-1230', 'flavio.assis.machado.130@exemplo.com'),
  ('Karina Moura Teixeira', '(45) 38847-7943', '(45) 99799-1301', 'karina.moura.teixeira.131@exemplo.com'),
  ('Aloísio Monteiro Cardoso', '(45) 38884-7996', '(45) 99828-1372', 'aloisio.monteiro.cardoso.132@exemplo.com'),
  ('Fernando Vieira Cardoso', '(45) 38921-8049', '(45) 99857-1443', 'fernando.vieira.cardoso.133@exemplo.com'),
  ('Fábio Machado Souza', '(45) 38958-8102', '(45) 99886-1514', 'fabio.machado.souza.134@exemplo.com'),
  ('Guilherme Carvalho Barros', '(45) 38995-8155', '(45) 99915-1585', 'guilherme.carvalho.barros.135@exemplo.com'),
  ('Hugo Barros Costa', '(45) 39032-8208', '(45) 99944-1656', 'hugo.barros.costa.136@exemplo.com'),
  ('Jorge Lima Martins', '(45) 39069-8261', '(45) 99973-1727', 'jorge.lima.martins.137@exemplo.com'),
  ('Lidiane Rocha Reis', '(45) 39106-8314', '(45) 98002-1798', 'lidiane.rocha.reis.138@exemplo.com'),
  ('Bárbara Martins Silva', '(45) 39143-8367', '(45) 98031-1869', 'barbara.martins.silva.139@exemplo.com'),
  ('Alberto Monteiro Assis', '(45) 39180-8420', '(45) 98060-1940', 'alberto.monteiro.assis.140@exemplo.com'),
  ('Bruno Moreira Oliveira', '(45) 39217-8473', '(45) 98089-2011', 'bruno.moreira.oliveira.141@exemplo.com'),
  ('Karina Moreira Nunes', '(45) 39254-8526', '(45) 98118-2082', 'karina.moreira.nunes.142@exemplo.com'),
  ('Bárbara Ribeiro Costa', '(45) 39291-8579', '(45) 98147-2153', 'barbara.ribeiro.costa.143@exemplo.com'),
  ('Ricardo Queiroz Barbosa', '(45) 39328-8632', '(45) 98176-2224', 'ricardo.queiroz.barbosa.144@exemplo.com'),
  ('Alexandre Ferreira Ramos', '(45) 39365-8685', '(45) 98205-2295', 'alexandre.ferreira.ramos.145@exemplo.com'),
  ('Karina Gomes Araújo', '(45) 39402-8738', '(45) 98234-2366', 'karina.gomes.araujo.146@exemplo.com'),
  ('Denise Pereira Souza', '(45) 39439-8791', '(45) 98263-2437', 'denise.pereira.souza.147@exemplo.com'),
  ('Eliane Cardoso Assis', '(45) 39476-8844', '(45) 98292-2508', 'eliane.cardoso.assis.148@exemplo.com'),
  ('Maurício Barcelos Moreira', '(45) 39513-8897', '(45) 98321-2579', 'mauricio.barcelos.moreira.149@exemplo.com'),
  ('Aloísio Ferreira Pires', '(45) 39550-8950', '(45) 98350-2650', 'aloisio.ferreira.pires.150@exemplo.com'),
  ('Luiz Cardoso Correia', '(45) 39587-9003', '(45) 98379-2721', 'luiz.cardoso.correia.151@exemplo.com'),
  ('Márcia Duarte Ramos', '(45) 39624-9056', '(45) 98408-2792', 'marcia.duarte.ramos.152@exemplo.com'),
  ('Carlos Monteiro Lima', '(45) 39661-9109', '(45) 98437-2863', 'carlos.monteiro.lima.153@exemplo.com'),
  ('Flávio Oliveira Vieira', '(45) 39698-9162', '(45) 98466-2934', 'flavio.oliveira.vieira.154@exemplo.com'),
  ('Maurício Cunha Assis', '(45) 39735-9215', '(45) 98495-3005', 'mauricio.cunha.assis.155@exemplo.com'),
  ('Luciana Santos Lima', '(45) 39772-9268', '(45) 98524-3076', 'luciana.santos.lima.156@exemplo.com'),
  ('Karina Barcelos Queiroz', '(45) 39809-9321', '(45) 98553-3147', 'karina.barcelos.queiroz.157@exemplo.com'),
  ('Alessandra Araújo Barcelos', '(45) 39846-9374', '(45) 98582-3218', 'alessandra.araujo.barcelos.158@exemplo.com'),
  ('Amélia Rocha Nunes', '(45) 39883-9427', '(45) 98611-3289', 'amelia.rocha.nunes.159@exemplo.com'),
  ('Cláudio Monteiro Araújo', '(45) 39920-9480', '(45) 98640-3360', 'claudio.monteiro.araujo.160@exemplo.com');

INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Maria Alice Ferreira Santos', '2017-02-02', 'Rua das Flores, 120', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Maria Alice Ferreira Santos' AND a.data_nascimento = '2017-02-02' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Batista Cunha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Melo Ribeiro', '2017-03-03', 'Rua das Flores, 121', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Melo Ribeiro' AND a.data_nascimento = '2017-03-03' AND a.ano_letivo = 2025
  AND r.nome = 'Viviane Moreira Reis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Joaquim Carvalho Ramos', '2017-04-04', 'Rua das Flores, 122', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Joaquim Carvalho Ramos' AND a.data_nascimento = '2017-04-04' AND a.ano_letivo = 2025
  AND r.nome = 'Daniela Barbosa Batista';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Matheus Queiroz Vieira', '2017-05-05', 'Rua das Flores, 123', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Matheus Queiroz Vieira' AND a.data_nascimento = '2017-05-05' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Teixeira Rocha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gael Santos Lima', '2017-06-06', 'Rua das Flores, 124', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gael Santos Lima' AND a.data_nascimento = '2017-06-06' AND a.ano_letivo = 2025
  AND r.nome = 'Guilherme Barcelos Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heloísa Ribeiro Duarte', '2017-07-07', 'Rua das Flores, 125', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heloísa Ribeiro Duarte' AND a.data_nascimento = '2017-07-07' AND a.ano_letivo = 2025
  AND r.nome = 'Viviane Reis Silva';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Lucas Santos Reis', '2017-08-08', 'Rua das Flores, 126', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Lucas Santos Reis' AND a.data_nascimento = '2017-08-08' AND a.ano_letivo = 2025
  AND r.nome = 'Renata Moreira Barros';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Valentina Ramos Batista', '2017-09-09', 'Rua das Flores, 127', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Valentina Ramos Batista' AND a.data_nascimento = '2017-09-09' AND a.ano_letivo = 2025
  AND r.nome = 'Alexandre Queiroz Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Luísa Monteiro Queiroz', '2017-10-10', 'Rua das Flores, 128', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Luísa Monteiro Queiroz' AND a.data_nascimento = '2017-10-10' AND a.ano_letivo = 2025
  AND r.nome = 'Jair Cunha Pires';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Silva Martins', '2017-11-11', 'Rua das Flores, 129', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Silva Martins' AND a.data_nascimento = '2017-11-11' AND a.ano_letivo = 2025
  AND r.nome = 'Aloísio Monteiro Barros';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Olívia Vieira Nascimento', '2017-12-12', 'Rua das Flores, 130', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Olívia Vieira Nascimento' AND a.data_nascimento = '2017-12-12' AND a.ano_letivo = 2025
  AND r.nome = 'César Nunes Martins';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Gomes Barros', '2017-01-13', 'Rua das Flores, 131', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Gomes Barros' AND a.data_nascimento = '2017-01-13' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Lima Moreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lara Carvalho Lima', '2017-02-14', 'Rua das Flores, 132', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lara Carvalho Lima' AND a.data_nascimento = '2017-02-14' AND a.ano_letivo = 2025
  AND r.nome = 'César Machado Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Aline Carvalho Pinto', '2017-03-15', 'Rua das Flores, 133', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Aline Carvalho Pinto' AND a.data_nascimento = '2017-03-15' AND a.ano_letivo = 2025
  AND r.nome = 'Cátia Melo Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Bianca Assis Costa', '2017-04-16', 'Rua das Flores, 134', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Bianca Assis Costa' AND a.data_nascimento = '2017-04-16' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Barbosa Gomes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Davi Pires Ramos', '2017-05-17', 'Rua das Flores, 135', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Davi Pires Ramos' AND a.data_nascimento = '2017-05-17' AND a.ano_letivo = 2025
  AND r.nome = 'Alessandra Oliveira Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Nicolás Teixeira Lima', '2017-06-18', 'Rua das Flores, 136', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Nicolás Teixeira Lima' AND a.data_nascimento = '2017-06-18' AND a.ano_letivo = 2025
  AND r.nome = 'Bruno Machado Pereira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lucca Moreira Machado', '2017-07-19', 'Rua das Flores, 137', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lucca Moreira Machado' AND a.data_nascimento = '2017-07-19' AND a.ano_letivo = 2025
  AND r.nome = 'Antônio Batista Barcelos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Fernanda Barcelos Barbosa', '2017-08-20', 'Rua das Flores, 138', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Fernanda Barcelos Barbosa' AND a.data_nascimento = '2017-08-20' AND a.ano_letivo = 2025
  AND r.nome = 'Gisele Teixeira Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gabriel Oliveira Ribeiro', '2017-09-21', 'Rua das Flores, 139', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gabriel Oliveira Ribeiro' AND a.data_nascimento = '2017-09-21' AND a.ano_letivo = 2025
  AND r.nome = 'Viviane Melo Gomes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Antonella Lima Ribeiro', '2017-10-22', 'Rua das Flores, 140', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Antonella Lima Ribeiro' AND a.data_nascimento = '2017-10-22' AND a.ano_letivo = 2025
  AND r.nome = 'Jair Silva Carvalho';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Benício Teixeira Araújo', '2017-11-23', 'Rua das Flores, 141', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Benício Teixeira Araújo' AND a.data_nascimento = '2017-11-23' AND a.ano_letivo = 2025
  AND r.nome = 'Rafael Vieira Ribeiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vitor Dias Martins', '2017-12-24', 'Rua das Flores, 142', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vitor Dias Martins' AND a.data_nascimento = '2017-12-24' AND a.ano_letivo = 2025
  AND r.nome = 'Fátima Moura Pires';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Juliana Pinto Barros', '2017-01-25', 'Rua das Flores, 143', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Juliana Pinto Barros' AND a.data_nascimento = '2017-01-25' AND a.ano_letivo = 2025
  AND r.nome = 'Ângela Reis Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Rebeca Araújo Pereira', '2017-02-26', 'Rua das Flores, 144', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Rebeca Araújo Pereira' AND a.data_nascimento = '2017-02-26' AND a.ano_letivo = 2025
  AND r.nome = 'Cristina Pires Almeida';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Lucas Martins Ramos', '2017-03-27', 'Rua das Flores, 145', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Lucas Martins Ramos' AND a.data_nascimento = '2017-03-27' AND a.ano_letivo = 2025
  AND r.nome = 'Rodrigo Pires Moura';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ayla Martins Pires', '2017-04-28', 'Rua das Flores, 146', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ayla Martins Pires' AND a.data_nascimento = '2017-04-28' AND a.ano_letivo = 2025
  AND r.nome = 'Eduardo Assis Cunha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Aline Araújo Reis', '2017-05-01', 'Rua das Flores, 147', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Aline Araújo Reis' AND a.data_nascimento = '2017-05-01' AND a.ano_letivo = 2025
  AND r.nome = 'Paulo Monteiro Machado';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Luísa Cunha Souza', '2017-06-02', 'Rua das Flores, 148', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Luísa Cunha Souza' AND a.data_nascimento = '2017-06-02' AND a.ano_letivo = 2025
  AND r.nome = 'Marcos Duarte Vieira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Maitê Oliveira Cunha', '2017-07-03', 'Rua das Flores, 149', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Maitê Oliveira Cunha' AND a.data_nascimento = '2017-07-03' AND a.ano_letivo = 2025
  AND r.nome = 'Eduardo Monteiro Martins';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gustavo Araújo Pereira', '2017-08-04', 'Rua das Flores, 150', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gustavo Araújo Pereira' AND a.data_nascimento = '2017-08-04' AND a.ano_letivo = 2025
  AND r.nome = 'Maurício Nunes Monteiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heloísa Barcelos Cunha', '2017-09-05', 'Rua das Flores, 151', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heloísa Barcelos Cunha' AND a.data_nascimento = '2017-09-05' AND a.ano_letivo = 2025
  AND r.nome = 'Luciana Melo Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heloísa Campos Correia', '2017-10-06', 'Rua das Flores, 152', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heloísa Campos Correia' AND a.data_nascimento = '2017-10-06' AND a.ano_letivo = 2025
  AND r.nome = 'Rafael Moura Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Maria Fernanda Pires Gomes', '2017-11-07', 'Rua das Flores, 153', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Maria Fernanda Pires Gomes' AND a.data_nascimento = '2017-11-07' AND a.ano_letivo = 2025
  AND r.nome = 'Hugo Melo Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lorena Almeida Melo', '2017-12-08', 'Rua das Flores, 154', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lorena Almeida Melo' AND a.data_nascimento = '2017-12-08' AND a.ano_letivo = 2025
  AND r.nome = 'Aloísio Pereira Moreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Bryan Ramos Costa', '2017-01-09', 'Rua das Flores, 155', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Bryan Ramos Costa' AND a.data_nascimento = '2017-01-09' AND a.ano_letivo = 2025
  AND r.nome = 'Lidiane Araújo Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Arthur Henrique Vieira Queiroz', '2017-02-10', 'Rua das Flores, 156', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Arthur Henrique Vieira Queiroz' AND a.data_nascimento = '2017-02-10' AND a.ano_letivo = 2025
  AND r.nome = 'Roberta Ramos Lima';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gustavo Dias Ribeiro', '2017-03-11', 'Rua das Flores, 157', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gustavo Dias Ribeiro' AND a.data_nascimento = '2017-03-11' AND a.ano_letivo = 2025
  AND r.nome = 'Daniela Gomes Ribeiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Joaquim Duarte Campos', '2017-04-12', 'Rua das Flores, 158', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Joaquim Duarte Campos' AND a.data_nascimento = '2017-04-12' AND a.ano_letivo = 2025
  AND r.nome = 'Vanessa Gomes Barros';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Matheus Souza Ferreira', '2017-05-13', 'Rua das Flores, 159', 2025, id_turma
FROM turma WHERE ano = 2 AND letra = 'A';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Matheus Souza Ferreira' AND a.data_nascimento = '2017-05-13' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Batista Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Leonardo Martins Vieira', '2016-06-14', 'Rua das Flores, 160', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Leonardo Martins Vieira' AND a.data_nascimento = '2016-06-14' AND a.ano_letivo = 2025
  AND r.nome = 'Daniel Pires Batista';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Miguel Pereira Teixeira', '2016-07-15', 'Rua das Flores, 161', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Miguel Pereira Teixeira' AND a.data_nascimento = '2016-07-15' AND a.ano_letivo = 2025
  AND r.nome = 'Ângela Barros Batista';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Aline Assis Pires', '2016-08-16', 'Rua das Flores, 162', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Aline Assis Pires' AND a.data_nascimento = '2016-08-16' AND a.ano_letivo = 2025
  AND r.nome = 'Vanessa Queiroz Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Stella Costa Reis', '2016-09-17', 'Rua das Flores, 163', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Stella Costa Reis' AND a.data_nascimento = '2016-09-17' AND a.ano_letivo = 2025
  AND r.nome = 'Paulo Barcelos Teixeira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heitor Ferreira Ramos', '2016-10-18', 'Rua das Flores, 164', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heitor Ferreira Ramos' AND a.data_nascimento = '2016-10-18' AND a.ano_letivo = 2025
  AND r.nome = 'Bruno Silva Pinto';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Liz Nascimento Ferreira', '2016-11-19', 'Rua das Flores, 165', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Liz Nascimento Ferreira' AND a.data_nascimento = '2016-11-19' AND a.ano_letivo = 2025
  AND r.nome = 'Renata Teixeira Batista';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Antonella Vieira Martins', '2016-12-20', 'Rua das Flores, 166', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Antonella Vieira Martins' AND a.data_nascimento = '2016-12-20' AND a.ano_letivo = 2025
  AND r.nome = 'Daniel Ramos Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vitor Silva Costa', '2016-01-21', 'Rua das Flores, 167', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vitor Silva Costa' AND a.data_nascimento = '2016-01-21' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Campos Ribeiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Mariana Rocha Duarte', '2016-02-22', 'Rua das Flores, 168', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Mariana Rocha Duarte' AND a.data_nascimento = '2016-02-22' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Vieira Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Pedro Cardoso Duarte', '2016-03-23', 'Rua das Flores, 169', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Pedro Cardoso Duarte' AND a.data_nascimento = '2016-03-23' AND a.ano_letivo = 2025
  AND r.nome = 'Alessandra Teixeira Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Lucas Barbosa Gomes', '2016-04-24', 'Rua das Flores, 170', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Lucas Barbosa Gomes' AND a.data_nascimento = '2016-04-24' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Correia Martins';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Juliana Martins Ramos', '2016-05-25', 'Rua das Flores, 171', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Juliana Martins Ramos' AND a.data_nascimento = '2016-05-25' AND a.ano_letivo = 2025
  AND r.nome = 'Antônio Almeida Machado';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Stella Silva Assis', '2016-06-26', 'Rua das Flores, 172', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Stella Silva Assis' AND a.data_nascimento = '2016-06-26' AND a.ano_letivo = 2025
  AND r.nome = 'Daniel Santos Correia';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Camila Campos Santos', '2016-07-27', 'Rua das Flores, 173', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Camila Campos Santos' AND a.data_nascimento = '2016-07-27' AND a.ano_letivo = 2025
  AND r.nome = 'Fernando Barcelos Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Enzo Dias Cardoso', '2016-08-28', 'Rua das Flores, 174', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Enzo Dias Cardoso' AND a.data_nascimento = '2016-08-28' AND a.ano_letivo = 2025
  AND r.nome = 'Cátia Vieira Almeida';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Cecília Souza Melo', '2016-09-01', 'Rua das Flores, 175', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Cecília Souza Melo' AND a.data_nascimento = '2016-09-01' AND a.ano_letivo = 2025
  AND r.nome = 'Antônio Rocha Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Kevin Lima Duarte', '2016-10-02', 'Rua das Flores, 176', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Kevin Lima Duarte' AND a.data_nascimento = '2016-10-02' AND a.ano_letivo = 2025
  AND r.nome = 'Luciana Teixeira Cunha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gabriel Ramos Almeida', '2016-11-03', 'Rua das Flores, 177', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gabriel Ramos Almeida' AND a.data_nascimento = '2016-11-03' AND a.ano_letivo = 2025
  AND r.nome = 'Janaína Pires Cunha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Henrique Nunes Reis', '2016-12-04', 'Rua das Flores, 178', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Henrique Nunes Reis' AND a.data_nascimento = '2016-12-04' AND a.ano_letivo = 2025
  AND r.nome = 'Simone Teixeira Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Helena Costa Moura', '2016-01-05', 'Rua das Flores, 179', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Helena Costa Moura' AND a.data_nascimento = '2016-01-05' AND a.ano_letivo = 2025
  AND r.nome = 'Paulo Batista Costa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Lucas Vieira Barros', '2016-02-06', 'Rua das Flores, 180', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Lucas Vieira Barros' AND a.data_nascimento = '2016-02-06' AND a.ano_letivo = 2025
  AND r.nome = 'Cátia Nunes Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Noah Barbosa Cardoso', '2016-03-07', 'Rua das Flores, 181', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Noah Barbosa Cardoso' AND a.data_nascimento = '2016-03-07' AND a.ano_letivo = 2025
  AND r.nome = 'Maurício Ramos Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gustavo Dias Monteiro', '2016-04-08', 'Rua das Flores, 182', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gustavo Dias Monteiro' AND a.data_nascimento = '2016-04-08' AND a.ano_letivo = 2025
  AND r.nome = 'Talita Ribeiro Pereira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Clara Monteiro Ferreira', '2016-05-09', 'Rua das Flores, 183', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Clara Monteiro Ferreira' AND a.data_nascimento = '2016-05-09' AND a.ano_letivo = 2025
  AND r.nome = 'Rafael Oliveira Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ayla Ribeiro Pereira', '2016-06-10', 'Rua das Flores, 184', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ayla Ribeiro Pereira' AND a.data_nascimento = '2016-06-10' AND a.ano_letivo = 2025
  AND r.nome = 'Lidiane Barbosa Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lara Santos Queiroz', '2016-07-11', 'Rua das Flores, 185', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lara Santos Queiroz' AND a.data_nascimento = '2016-07-11' AND a.ano_letivo = 2025
  AND r.nome = 'Guilherme Gomes Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lucca Ribeiro Queiroz', '2016-08-12', 'Rua das Flores, 186', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lucca Ribeiro Queiroz' AND a.data_nascimento = '2016-08-12' AND a.ano_letivo = 2025
  AND r.nome = 'Daniela Nunes Ferreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Luísa Silva Pereira', '2016-09-13', 'Rua das Flores, 187', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Luísa Silva Pereira' AND a.data_nascimento = '2016-09-13' AND a.ano_letivo = 2025
  AND r.nome = 'Fábio Barros Pires';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Helena Maria Souza Ribeiro', '2016-10-14', 'Rua das Flores, 188', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Helena Maria Souza Ribeiro' AND a.data_nascimento = '2016-10-14' AND a.ano_letivo = 2025
  AND r.nome = 'Luiz Costa Dias';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gabriel Oliveira Nascimento', '2016-11-15', 'Rua das Flores, 189', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gabriel Oliveira Nascimento' AND a.data_nascimento = '2016-11-15' AND a.ano_letivo = 2025
  AND r.nome = 'Eliane Assis Ferreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Samuel Duarte Melo', '2016-12-16', 'Rua das Flores, 190', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Samuel Duarte Melo' AND a.data_nascimento = '2016-12-16' AND a.ano_letivo = 2025
  AND r.nome = 'Rafael Martins Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Campos Barros', '2016-01-17', 'Rua das Flores, 191', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Campos Barros' AND a.data_nascimento = '2016-01-17' AND a.ano_letivo = 2025
  AND r.nome = 'Cláudia Queiroz Santos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Noah Almeida Barcelos', '2016-02-18', 'Rua das Flores, 192', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Noah Almeida Barcelos' AND a.data_nascimento = '2016-02-18' AND a.ano_letivo = 2025
  AND r.nome = 'Renata Barcelos Teixeira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ian Nunes Melo', '2016-03-19', 'Rua das Flores, 193', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ian Nunes Melo' AND a.data_nascimento = '2016-03-19' AND a.ano_letivo = 2025
  AND r.nome = 'Viviane Barbosa Pereira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ana Júlia Batista Barbosa', '2016-04-20', 'Rua das Flores, 194', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ana Júlia Batista Barbosa' AND a.data_nascimento = '2016-04-20' AND a.ano_letivo = 2025
  AND r.nome = 'Fernando Melo Carvalho';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Benício Carvalho Vieira', '2016-05-21', 'Rua das Flores, 195', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Benício Carvalho Vieira' AND a.data_nascimento = '2016-05-21' AND a.ano_letivo = 2025
  AND r.nome = 'Luiz Cardoso Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Eduarda Vieira Batista', '2016-06-22', 'Rua das Flores, 196', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Eduarda Vieira Batista' AND a.data_nascimento = '2016-06-22' AND a.ano_letivo = 2025
  AND r.nome = 'Rodrigo Ferreira Barcelos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Igor Souza Carvalho', '2016-07-23', 'Rua das Flores, 197', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Igor Souza Carvalho' AND a.data_nascimento = '2016-07-23' AND a.ano_letivo = 2025
  AND r.nome = 'Ricardo Oliveira Pinto';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ravi Correia Nascimento', '2016-08-24', 'Rua das Flores, 198', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ravi Correia Nascimento' AND a.data_nascimento = '2016-08-24' AND a.ano_letivo = 2025
  AND r.nome = 'Daniel Vieira Dias';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Pedro Melo Barbosa', '2016-09-25', 'Rua das Flores, 199', 2025, id_turma
FROM turma WHERE ano = 3 AND letra = 'B';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Pedro Melo Barbosa' AND a.data_nascimento = '2016-09-25' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Duarte Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Sophia Ramos Monteiro', '2015-10-26', 'Rua das Flores, 200', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Sophia Ramos Monteiro' AND a.data_nascimento = '2015-10-26' AND a.ano_letivo = 2025
  AND r.nome = 'Adriana Batista Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Joaquim Vieira Rocha', '2015-11-27', 'Rua das Flores, 201', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Joaquim Vieira Rocha' AND a.data_nascimento = '2015-11-27' AND a.ano_letivo = 2025
  AND r.nome = 'Cláudia Vieira Dias';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Pires Melo', '2015-12-28', 'Rua das Flores, 202', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Pires Melo' AND a.data_nascimento = '2015-12-28' AND a.ano_letivo = 2025
  AND r.nome = 'Hugo Pires Gomes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Samuel Monteiro Reis', '2015-01-01', 'Rua das Flores, 203', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Samuel Monteiro Reis' AND a.data_nascimento = '2015-01-01' AND a.ano_letivo = 2025
  AND r.nome = 'Alexandre Rocha Moura';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Benício Souza Ramos', '2015-02-02', 'Rua das Flores, 204', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Benício Souza Ramos' AND a.data_nascimento = '2015-02-02' AND a.ano_letivo = 2025
  AND r.nome = 'Jair Araújo Machado';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heitor Lima Melo', '2015-03-03', 'Rua das Flores, 205', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heitor Lima Melo' AND a.data_nascimento = '2015-03-03' AND a.ano_letivo = 2025
  AND r.nome = 'Rodrigo Ramos Nunes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Helena Batista Campos', '2015-04-04', 'Rua das Flores, 206', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Helena Batista Campos' AND a.data_nascimento = '2015-04-04' AND a.ano_letivo = 2025
  AND r.nome = 'Antônio Vieira Queiroz';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Maria Eduarda Barros Correia', '2015-05-05', 'Rua das Flores, 207', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Maria Eduarda Barros Correia' AND a.data_nascimento = '2015-05-05' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Cunha Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ravi Martins Teixeira', '2015-06-06', 'Rua das Flores, 208', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ravi Martins Teixeira' AND a.data_nascimento = '2015-06-06' AND a.ano_letivo = 2025
  AND r.nome = 'Cátia Araújo Monteiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Arthur Teixeira Costa', '2015-07-07', 'Rua das Flores, 209', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Arthur Teixeira Costa' AND a.data_nascimento = '2015-07-07' AND a.ano_letivo = 2025
  AND r.nome = 'Lidiane Pires Barcelos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vitor Moreira Vieira', '2015-08-08', 'Rua das Flores, 210', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vitor Moreira Vieira' AND a.data_nascimento = '2015-08-08' AND a.ano_letivo = 2025
  AND r.nome = 'Guilherme Teixeira Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Olívia Reis Campos', '2015-09-09', 'Rua das Flores, 211', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Olívia Reis Campos' AND a.data_nascimento = '2015-09-09' AND a.ano_letivo = 2025
  AND r.nome = 'Alessandra Campos Cunha';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Leonardo Barbosa Moreira', '2015-10-10', 'Rua das Flores, 212', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Leonardo Barbosa Moreira' AND a.data_nascimento = '2015-10-10' AND a.ano_letivo = 2025
  AND r.nome = 'Fátima Campos Barros';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heloísa Souza Queiroz', '2015-11-11', 'Rua das Flores, 213', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heloísa Souza Queiroz' AND a.data_nascimento = '2015-11-11' AND a.ano_letivo = 2025
  AND r.nome = 'Talita Costa Nascimento';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Noah Souza Cunha', '2015-12-12', 'Rua das Flores, 214', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Noah Souza Cunha' AND a.data_nascimento = '2015-12-12' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Assis Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ravi Souza Queiroz', '2015-01-13', 'Rua das Flores, 215', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ravi Souza Queiroz' AND a.data_nascimento = '2015-01-13' AND a.ano_letivo = 2025
  AND r.nome = 'Eduardo Silva Moura';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Maria Eduarda Duarte Moura', '2015-02-14', 'Rua das Flores, 216', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Maria Eduarda Duarte Moura' AND a.data_nascimento = '2015-02-14' AND a.ano_letivo = 2025
  AND r.nome = 'Gisele Lima Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Alice Souza Duarte', '2015-03-15', 'Rua das Flores, 217', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Alice Souza Duarte' AND a.data_nascimento = '2015-03-15' AND a.ano_letivo = 2025
  AND r.nome = 'Marcos Batista Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lucas Rocha Pereira', '2015-04-16', 'Rua das Flores, 218', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lucas Rocha Pereira' AND a.data_nascimento = '2015-04-16' AND a.ano_letivo = 2025
  AND r.nome = 'Eduardo Melo Nunes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'João Miguel Pereira Melo', '2015-05-17', 'Rua das Flores, 219', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'João Miguel Pereira Melo' AND a.data_nascimento = '2015-05-17' AND a.ano_letivo = 2025
  AND r.nome = 'Jair Campos Monteiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gustavo Ferreira Barcelos', '2015-06-18', 'Rua das Flores, 220', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gustavo Ferreira Barcelos' AND a.data_nascimento = '2015-06-18' AND a.ano_letivo = 2025
  AND r.nome = 'Ricardo Santos Lima';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ayla Queiroz Assis', '2015-07-19', 'Rua das Flores, 221', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ayla Queiroz Assis' AND a.data_nascimento = '2015-07-19' AND a.ano_letivo = 2025
  AND r.nome = 'Michele Ribeiro Correia';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Davi Machado Lima', '2015-08-20', 'Rua das Flores, 222', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Davi Machado Lima' AND a.data_nascimento = '2015-08-20' AND a.ano_letivo = 2025
  AND r.nome = 'Luiz Melo Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Felipe Queiroz Barcelos', '2015-09-21', 'Rua das Flores, 223', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Felipe Queiroz Barcelos' AND a.data_nascimento = '2015-09-21' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Queiroz Dias';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Clara Cunha Costa', '2015-10-22', 'Rua das Flores, 224', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Clara Cunha Costa' AND a.data_nascimento = '2015-10-22' AND a.ano_letivo = 2025
  AND r.nome = 'Bruno Reis Moura';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Isabella Cunha Melo', '2015-11-23', 'Rua das Flores, 225', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Isabella Cunha Melo' AND a.data_nascimento = '2015-11-23' AND a.ano_letivo = 2025
  AND r.nome = 'Talita Vieira Reis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lorena Correia Almeida', '2015-12-24', 'Rua das Flores, 226', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lorena Correia Almeida' AND a.data_nascimento = '2015-12-24' AND a.ano_letivo = 2025
  AND r.nome = 'Simone Pinto Pires';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Rebeca Cardoso Pires', '2015-01-25', 'Rua das Flores, 227', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Rebeca Cardoso Pires' AND a.data_nascimento = '2015-01-25' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Cardoso Costa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Bruna Pereira Silva', '2015-02-26', 'Rua das Flores, 228', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Bruna Pereira Silva' AND a.data_nascimento = '2015-02-26' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Ferreira Barbosa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vitor Machado Barcelos', '2015-03-27', 'Rua das Flores, 229', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vitor Machado Barcelos' AND a.data_nascimento = '2015-03-27' AND a.ano_letivo = 2025
  AND r.nome = 'Roberta Ferreira Ramos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Benício Pereira Ramos', '2015-04-28', 'Rua das Flores, 230', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Benício Pereira Ramos' AND a.data_nascimento = '2015-04-28' AND a.ano_letivo = 2025
  AND r.nome = 'Paulo Rocha Barbosa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heloísa Duarte Costa', '2015-05-01', 'Rua das Flores, 231', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heloísa Duarte Costa' AND a.data_nascimento = '2015-05-01' AND a.ano_letivo = 2025
  AND r.nome = 'Janaína Nunes Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Henrique Pinto Pereira', '2015-06-02', 'Rua das Flores, 232', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Henrique Pinto Pereira' AND a.data_nascimento = '2015-06-02' AND a.ano_letivo = 2025
  AND r.nome = 'Marcos Queiroz Moura';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ayla Dias Moreira', '2015-07-03', 'Rua das Flores, 233', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ayla Dias Moreira' AND a.data_nascimento = '2015-07-03' AND a.ano_letivo = 2025
  AND r.nome = 'Flávio Moreira Carvalho';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Alice Monteiro Ramos', '2015-08-04', 'Rua das Flores, 234', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Alice Monteiro Ramos' AND a.data_nascimento = '2015-08-04' AND a.ano_letivo = 2025
  AND r.nome = 'Gisele Moreira Ribeiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ericka Machado Moura', '2015-09-05', 'Rua das Flores, 235', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ericka Machado Moura' AND a.data_nascimento = '2015-09-05' AND a.ano_letivo = 2025
  AND r.nome = 'Tatiana Rocha Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Heitor Reis Cardoso', '2015-10-06', 'Rua das Flores, 236', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Heitor Reis Cardoso' AND a.data_nascimento = '2015-10-06' AND a.ano_letivo = 2025
  AND r.nome = 'Adriana Ramos Almeida';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Melissa Carvalho Almeida', '2015-11-07', 'Rua das Flores, 237', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Melissa Carvalho Almeida' AND a.data_nascimento = '2015-11-07' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Oliveira Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lorena Ferreira Carvalho', '2015-12-08', 'Rua das Flores, 238', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lorena Ferreira Carvalho' AND a.data_nascimento = '2015-12-08' AND a.ano_letivo = 2025
  AND r.nome = 'Eduardo Moreira Almeida';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lucca Gomes Araújo', '2015-01-09', 'Rua das Flores, 239', 2025, id_turma
FROM turma WHERE ano = 4 AND letra = 'C';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lucca Gomes Araújo' AND a.data_nascimento = '2015-01-09' AND a.ano_letivo = 2025
  AND r.nome = 'Hugo Campos Carvalho';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Giovanna Assis Barros', '2014-02-10', 'Rua das Flores, 240', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Giovanna Assis Barros' AND a.data_nascimento = '2014-02-10' AND a.ano_letivo = 2025
  AND r.nome = 'Adriana Barcelos Moreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Lara Barros Costa', '2014-03-11', 'Rua das Flores, 241', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Lara Barros Costa' AND a.data_nascimento = '2014-03-11' AND a.ano_letivo = 2025
  AND r.nome = 'Bruno Nunes Monteiro';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Mariana Campos Costa', '2014-04-12', 'Rua das Flores, 242', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Mariana Campos Costa' AND a.data_nascimento = '2014-04-12' AND a.ano_letivo = 2025
  AND r.nome = 'Simone Rocha Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Bernardo Lima Vieira', '2014-05-13', 'Rua das Flores, 243', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Bernardo Lima Vieira' AND a.data_nascimento = '2014-05-13' AND a.ano_letivo = 2025
  AND r.nome = 'Luciana Nunes Ferreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Oliveira Silva', '2014-06-14', 'Rua das Flores, 244', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Oliveira Silva' AND a.data_nascimento = '2014-06-14' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Correia Campos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Letícia Almeida Costa', '2014-07-15', 'Rua das Flores, 245', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Letícia Almeida Costa' AND a.data_nascimento = '2014-07-15' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Barcelos Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Alice Monteiro Reis', '2014-08-16', 'Rua das Flores, 246', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Alice Monteiro Reis' AND a.data_nascimento = '2014-08-16' AND a.ano_letivo = 2025
  AND r.nome = 'Denise Gomes Barcelos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Daniel Reis Silva', '2014-09-17', 'Rua das Flores, 247', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Daniel Reis Silva' AND a.data_nascimento = '2014-09-17' AND a.ano_letivo = 2025
  AND r.nome = 'Renata Lima Melo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Enzo Pereira Gomes', '2014-10-18', 'Rua das Flores, 248', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Enzo Pereira Gomes' AND a.data_nascimento = '2014-10-18' AND a.ano_letivo = 2025
  AND r.nome = 'Cristina Reis Batista';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Noah Oliveira Dias', '2014-11-19', 'Rua das Flores, 249', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Noah Oliveira Dias' AND a.data_nascimento = '2014-11-19' AND a.ano_letivo = 2025
  AND r.nome = 'Flávio Assis Machado';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Arthur Henrique Reis Gomes', '2014-12-20', 'Rua das Flores, 250', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Arthur Henrique Reis Gomes' AND a.data_nascimento = '2014-12-20' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Moura Teixeira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vinícius Almeida Oliveira', '2014-01-21', 'Rua das Flores, 251', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vinícius Almeida Oliveira' AND a.data_nascimento = '2014-01-21' AND a.ano_letivo = 2025
  AND r.nome = 'Aloísio Monteiro Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Sofia Dias Oliveira', '2014-02-22', 'Rua das Flores, 252', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Sofia Dias Oliveira' AND a.data_nascimento = '2014-02-22' AND a.ano_letivo = 2025
  AND r.nome = 'Fernando Vieira Cardoso';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Eduarda Barros Melo', '2014-03-23', 'Rua das Flores, 253', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Eduarda Barros Melo' AND a.data_nascimento = '2014-03-23' AND a.ano_letivo = 2025
  AND r.nome = 'Fábio Machado Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Rebeca Carvalho Pinto', '2014-04-24', 'Rua das Flores, 254', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Rebeca Carvalho Pinto' AND a.data_nascimento = '2014-04-24' AND a.ano_letivo = 2025
  AND r.nome = 'Guilherme Carvalho Barros';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Bryan Batista Machado', '2014-05-25', 'Rua das Flores, 255', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Bryan Batista Machado' AND a.data_nascimento = '2014-05-25' AND a.ano_letivo = 2025
  AND r.nome = 'Hugo Barros Costa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Leonardo Melo Martins', '2014-06-26', 'Rua das Flores, 256', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Leonardo Melo Martins' AND a.data_nascimento = '2014-06-26' AND a.ano_letivo = 2025
  AND r.nome = 'Jorge Lima Martins';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Laura Batista Santos', '2014-07-27', 'Rua das Flores, 257', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Laura Batista Santos' AND a.data_nascimento = '2014-07-27' AND a.ano_letivo = 2025
  AND r.nome = 'Lidiane Rocha Reis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Laura Nascimento Batista', '2014-08-28', 'Rua das Flores, 258', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Laura Nascimento Batista' AND a.data_nascimento = '2014-08-28' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Martins Silva';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Rebeca Melo Araújo', '2014-09-01', 'Rua das Flores, 259', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Rebeca Melo Araújo' AND a.data_nascimento = '2014-09-01' AND a.ano_letivo = 2025
  AND r.nome = 'Alberto Monteiro Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Alice Carvalho Teixeira', '2014-10-02', 'Rua das Flores, 260', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Alice Carvalho Teixeira' AND a.data_nascimento = '2014-10-02' AND a.ano_letivo = 2025
  AND r.nome = 'Bruno Moreira Oliveira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gael Nunes Ribeiro', '2014-11-03', 'Rua das Flores, 261', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gael Nunes Ribeiro' AND a.data_nascimento = '2014-11-03' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Moreira Nunes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Valentina Pires Pinto', '2014-12-04', 'Rua das Flores, 262', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Valentina Pires Pinto' AND a.data_nascimento = '2014-12-04' AND a.ano_letivo = 2025
  AND r.nome = 'Bárbara Ribeiro Costa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Sofia Ribeiro Santos', '2014-01-05', 'Rua das Flores, 263', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Sofia Ribeiro Santos' AND a.data_nascimento = '2014-01-05' AND a.ano_letivo = 2025
  AND r.nome = 'Ricardo Queiroz Barbosa';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Melissa Barbosa Correia', '2014-02-06', 'Rua das Flores, 264', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Melissa Barbosa Correia' AND a.data_nascimento = '2014-02-06' AND a.ano_letivo = 2025
  AND r.nome = 'Alexandre Ferreira Ramos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Letícia Araújo Pereira', '2014-03-07', 'Rua das Flores, 265', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Letícia Araújo Pereira' AND a.data_nascimento = '2014-03-07' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Gomes Araújo';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Beatriz Pinto Duarte', '2014-04-08', 'Rua das Flores, 266', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Beatriz Pinto Duarte' AND a.data_nascimento = '2014-04-08' AND a.ano_letivo = 2025
  AND r.nome = 'Denise Pereira Souza';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gustavo Ramos Nascimento', '2014-05-09', 'Rua das Flores, 267', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gustavo Ramos Nascimento' AND a.data_nascimento = '2014-05-09' AND a.ano_letivo = 2025
  AND r.nome = 'Eliane Cardoso Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Theo Ferreira Costa', '2014-06-10', 'Rua das Flores, 268', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Theo Ferreira Costa' AND a.data_nascimento = '2014-06-10' AND a.ano_letivo = 2025
  AND r.nome = 'Maurício Barcelos Moreira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Laura Queiroz Costa', '2014-07-11', 'Rua das Flores, 269', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Laura Queiroz Costa' AND a.data_nascimento = '2014-07-11' AND a.ano_letivo = 2025
  AND r.nome = 'Aloísio Ferreira Pires';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Gael Carvalho Assis', '2014-08-12', 'Rua das Flores, 270', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Gael Carvalho Assis' AND a.data_nascimento = '2014-08-12' AND a.ano_letivo = 2025
  AND r.nome = 'Luiz Cardoso Correia';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vinícius Pinto Cunha', '2014-09-13', 'Rua das Flores, 271', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vinícius Pinto Cunha' AND a.data_nascimento = '2014-09-13' AND a.ano_letivo = 2025
  AND r.nome = 'Márcia Duarte Ramos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vinícius Assis Duarte', '2014-10-14', 'Rua das Flores, 272', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vinícius Assis Duarte' AND a.data_nascimento = '2014-10-14' AND a.ano_letivo = 2025
  AND r.nome = 'Carlos Monteiro Lima';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Enzo Teixeira Barcelos', '2014-11-15', 'Rua das Flores, 273', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Enzo Teixeira Barcelos' AND a.data_nascimento = '2014-11-15' AND a.ano_letivo = 2025
  AND r.nome = 'Flávio Oliveira Vieira';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Sophia Costa Oliveira', '2014-12-16', 'Rua das Flores, 274', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Sophia Costa Oliveira' AND a.data_nascimento = '2014-12-16' AND a.ano_letivo = 2025
  AND r.nome = 'Maurício Cunha Assis';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vinícius Silva Moura', '2014-01-17', 'Rua das Flores, 275', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vinícius Silva Moura' AND a.data_nascimento = '2014-01-17' AND a.ano_letivo = 2025
  AND r.nome = 'Luciana Santos Lima';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Pietra Barbosa Dias', '2014-02-18', 'Rua das Flores, 276', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Pietra Barbosa Dias' AND a.data_nascimento = '2014-02-18' AND a.ano_letivo = 2025
  AND r.nome = 'Karina Barcelos Queiroz';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Vinícius Pereira Nascimento', '2014-03-19', 'Rua das Flores, 277', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Vinícius Pereira Nascimento' AND a.data_nascimento = '2014-03-19' AND a.ano_letivo = 2025
  AND r.nome = 'Alessandra Araújo Barcelos';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Pedro Lucas Cunha Ferreira', '2014-04-20', 'Rua das Flores, 278', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Pedro Lucas Cunha Ferreira' AND a.data_nascimento = '2014-04-20' AND a.ano_letivo = 2025
  AND r.nome = 'Amélia Rocha Nunes';
INSERT INTO aluno (nome, data_nascimento, endereco, ano_letivo, id_turma)
SELECT 'Ericka Duarte Cardoso', '2014-05-21', 'Rua das Flores, 279', 2025, id_turma
FROM turma WHERE ano = 5 AND letra = 'D';
INSERT INTO aluno_responsavel (id_aluno, id_responsavel)
SELECT a.id_aluno, r.id_responsavel
FROM aluno a, responsavel r
WHERE a.nome = 'Ericka Duarte Cardoso' AND a.data_nascimento = '2014-05-21' AND a.ano_letivo = 2025
  AND r.nome = 'Cláudio Monteiro Araújo';

