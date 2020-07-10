CREATE DATABASE CRIADOR_TREINOS;
USE CRIADOR_TREINOS;

CREATE TABLE personal(
personal_id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(70) NOT NULL,
senha VARCHAR(255) NOT NULL,
data_de_nascimento DATE,
email VARCHAR(320) NOT NULL,
PRIMARY KEY (personal_id)
);

CREATE TABLE aluno(
aluno_id INT NOT NULL AUTO_INCREMENT,
personal_id INT NOT NULL,
nome VARCHAR(70) NOT NULL,
senha VARCHAR(255) NOT NULL,
endereco VARCHAR(30),
sexo VARCHAR(10),
data_de_nascimento DATE,
nivel_de_treinamento VARCHAR(15),
objetivo VARCHAR(100),
email VARCHAR(320) NOT NULL,
observacoes TEXT,
PRIMARY KEY (aluno_id),
FOREIGN KEY (personal_id) REFERENCES personal(personal_id) ON DELETE CASCADE
);

CREATE TABLE treino(
treino_id INT NOT NULL AUTO_INCREMENT,
aluno_id INT NOT NULL,
observacoes TEXT,
objetivo VARCHAR(50),
data DATE,
PRIMARY KEY (treino_id),
FOREIGN KEY (aluno_id) REFERENCES aluno(aluno_id) ON DELETE CASCADE
);

CREATE TABLE divisao(
divisao_id INT NOT NULL AUTO_INCREMENT,
treino_id INT NOT NULL,
rotulo VARCHAR(1),
descricao VARCHAR(45),
PRIMARY KEY (divisao_id),
FOREIGN KEY (treino_id) REFERENCES treino(treino_id) ON DELETE CASCADE
);

CREATE TABLE exercicio(
exercicio_id INT NOT NULL AUTO_INCREMENT,
personal_id INT NOT NULL,
nome_exercicio VARCHAR(100),
descricao TEXT,
tipo_de_estimulo VARCHAR(30),
PRIMARY KEY (exercicio_id),
FOREIGN KEY (personal_id) REFERENCES personal(personal_id) ON DELETE CASCADE
);
CREATE TABLE divisao_exercicio(
divisao_exercicio_id INT NOT NULL AUTO_INCREMENT,
exercicio_id INT NOT NULL,
divisao_id INT NOT NULL,
n_series VARCHAR(30),
n_repeticoes VARCHAR(30),
carga VARCHAR(30),
observacoes TEXT,
PRIMARY KEY (divisao_exercicio_id),
FOREIGN KEY (exercicio_id) REFERENCES exercicio(exercicio_id) ON DELETE CASCADE,
FOREIGN KEY (divisao_id) REFERENCES divisao(divisao_id) ON DELETE CASCADE
);

