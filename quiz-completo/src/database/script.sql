CREATE DATABASE comunidade_kingsman;
USE comunidade_kingsman;

-- Usuários
CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL
);

-- Quizzes
CREATE TABLE quiz (
  id_quiz INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  descricao VARCHAR(200)
);

-- Quiz respondido pelo usuário (associativa)
CREATE TABLE usuario_quiz (
  id_usuario_quiz INT AUTO_INCREMENT PRIMARY KEY,
  fk_usuario INT,
  fk_quiz INT,
  data_inicio DATETIME DEFAULT NOW(),
  data_fim DATETIME,
  FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (fk_quiz) REFERENCES quiz(id_quiz)
);

-- Perguntas
CREATE TABLE pergunta (
  id_pergunta INT AUTO_INCREMENT PRIMARY KEY,
  texto VARCHAR(250) NOT NULL,
  fk_quiz INT,
  FOREIGN KEY (fk_quiz) REFERENCES quiz(id_quiz)
);

-- Alternativas
CREATE TABLE alternativas (
  id_resposta INT AUTO_INCREMENT PRIMARY KEY,
  texto VARCHAR(200) NOT NULL,
  correta BOOLEAN DEFAULT FALSE,
  fk_pergunta INT,
  FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id_pergunta)
);

-- Respostas do usuário
CREATE TABLE resposta_usuario (
  id_resposta_usuario INT AUTO_INCREMENT PRIMARY KEY,
  fk_usuario_quiz INT,
  fk_pergunta INT,
  fk_resposta INT,
  FOREIGN KEY (fk_usuario_quiz) REFERENCES usuario_quiz(id_usuario_quiz),
  FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id_pergunta),
  FOREIGN KEY (fk_resposta) REFERENCES alternativas(id_resposta)
);


-- Usuário exemplo
INSERT INTO usuario (nome, email, senha)
VALUES ('Breno Abílio', 'breno@kingsman.com', 'senha123');

-- Quiz
INSERT INTO quiz (nome, descricao)
VALUES ('Quiz de Moda Masculina', 'Teste seu conhecimento sobre elegância atemporal.');

-- Registrar que o usuário vai fazer o quiz
INSERT INTO usuario_quiz (fk_usuario, fk_quiz)
VALUES (1, 1);

-- Perguntas
INSERT INTO pergunta (texto, fk_quiz)
VALUES ('Qual tecido é mais indicado para ternos de alta qualidade?', 1),
       ('Qual sapato é mais formal?', 1);

-- Alternativas da pergunta 1
INSERT INTO alternativas (texto, correta, fk_pergunta)
VALUES ('Lã fria', TRUE, 1),
       ('Poliéster', FALSE, 1),
       ('Viscose', FALSE, 1);

-- Alternativas da pergunta 2
INSERT INTO alternativas (texto, correta, fk_pergunta)
VALUES ('Oxford', TRUE, 2),
       ('Mocassim', FALSE, 2),
       ('Sandália', FALSE, 2);

-- Respostas do usuário
INSERT INTO resposta_usuario (fk_usuario_quiz, fk_pergunta, fk_resposta)
VALUES (1, 1, 1),  -- acertou
       (1, 2, 4);  -- acertou
       
       
-- SELECT RELATÓRIO 
SELECT u.nome AS usuario,
       q.nome AS quiz,
       p.texto AS pergunta,
       a.texto AS resposta_marcada,
       a.correta AS acertou
FROM resposta_usuario ru
JOIN usuario_quiz uq ON ru.fk_usuario_quiz = uq.id_usuario_quiz
JOIN usuario u ON uq.fk_usuario = u.id_usuario
JOIN alternativas a ON ru.fk_resposta = a.id_resposta
JOIN pergunta p ON ru.fk_pergunta = p.id_pergunta
JOIN quiz q ON uq.fk_quiz = q.id_quiz
WHERE u.id_usuario = 1;


-- "VIEW" de ranking
CREATE VIEW vw_ranking_quiz AS
SELECT u.nome,
       q.nome AS quiz,
       COUNT(a.correta = 1) AS total_acertos
FROM resposta_usuario ru
JOIN usuario_quiz uq ON ru.fk_usuario_quiz = uq.id_usuario_quiz
JOIN usuario u ON uq.fk_usuario = u.id_usuario
JOIN alternativas a ON ru.fk_resposta = a.id_resposta
JOIN quiz q ON uq.fk_quiz = q.id_quiz
WHERE a.correta = TRUE
GROUP BY u.nome, q.nome;

SELECT * FROM vw_ranking_quiz;

-- % de Acertos para Dashboard (por usuário e quiz)

SELECT 
  u.nome,
  q.nome AS quiz,
  ROUND(
    (SUM(a.correta = 1) / COUNT(*)) * 100, 2 -- porcentagem de acertos do usuário no quiz.
  ) AS porcentagem_acertos
FROM resposta_usuario ru
JOIN usuario_quiz uq ON ru.fk_usuario_quiz = uq.id_usuario_quiz
JOIN usuario u ON uq.fk_usuario = u.id_usuario
JOIN alternativas a ON ru.fk_resposta = a.id_resposta
JOIN quiz q ON uq.fk_quiz = q.id_quiz
WHERE u.id_usuario = 1
GROUP BY u.nome, q.nome;




