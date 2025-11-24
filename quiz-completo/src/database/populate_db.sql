-- Quiz 1

INSERT INTO quiz (nome, descricao)
VALUES ('Moda Clássica Masculina', 'Teste seus conhecimentos sobre estilo masculino atemporal e boas práticas de elegância.');

INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual tecido é mais indicado para ternos de alta qualidade?', 1),
('Qual acessório é considerado indispensável em um traje formal?', 1),
('Qual modelagem de camisa é a mais tradicional no estilo clássico?', 1),
('Qual é o sapato mais formal entre as opções abaixo?', 1),
('Qual é a regra geral para o comprimento ideal da barra da calça social?', 1);

-- Pergunta 1
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lã fria', TRUE, 1),
('Poliéster', FALSE, 1),
('Viscose', FALSE, 1);

-- Pergunta 2
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Gravata', TRUE, 2),
('Pulseira', FALSE, 2),
('Boné', FALSE, 2);

-- Pergunta 3
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Camisa com colarinho clássico (tradicional)', TRUE, 3),
('Camisa oversized', FALSE, 3),
('Camisa com gola padre', FALSE, 3);

-- Pergunta 4
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Oxford', TRUE, 4),
('Loafer', FALSE, 4),
('Tênis branco', FALSE, 4);

-- Pergunta 5
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Tocar levemente o peito do sapato', TRUE, 5),
('Ficar acima do tornozelo', FALSE, 5),
('Arrastar no chão', FALSE, 5);


-- Quiz 2

INSERT INTO quiz (nome, descricao)
VALUES ('Sapatos Masculinos', 'Teste seus conhecimentos sobre modelos, materiais e cuidados com calçados clássicos.');

INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual destes sapatos é considerado o mais formal?', 3),
('Qual material é mais utilizado em sapatos de alta qualidade?', 3),
('Qual é a principal característica de um sapato Derby?', 3),
('Qual sapato é conhecido pelo detalhe de perfurações decorativas?', 3),
('Qual destes calçados é ideal para ocasiões casuais?', 3);

-- Pergunta 1 (id_pergunta = 11)
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Oxford', TRUE, 11),
('Mocassim', FALSE, 11),
('Chelsea Boot', FALSE, 11);

-- Pergunta 2 (id_pergunta = 12)
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Couro legítimo', TRUE, 12),
('Camurça sintética', FALSE, 12),
('Plástico PU', FALSE, 12);

-- Pergunta 3 (id_pergunta = 13)
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cadarços com abas abertas', TRUE, 13),
('Cadarços com abas fechadas', FALSE, 13),
('Ausência de cadarço', FALSE, 13);

-- Pergunta 4 (id_pergunta = 14)
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Brogue', TRUE, 14),
('Derby liso', FALSE, 14),
('Loafer Penny', FALSE, 14);

-- Pergunta 5 (id_pergunta = 15)
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Mocassim', TRUE, 15),
('Oxford preto', FALSE, 15),
('Wholecut', FALSE, 15);


-- Quiz 3

INSERT INTO quiz (nome, descricao)
VALUES ('Acessórios Masculinos', 'Avalie seu conhecimento sobre acessórios essenciais do estilo clássico masculino.');

INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual acessório é tradicionalmente usado com trajes formais e deve ser da mesma cor do sapato?', 3),
('Qual material é mais indicado para um relógio clássico?', 3),
('Qual acessório ajuda a estruturar e valorizar a lapela do paletó?', 3),
('Qual item é obrigatório em trajes que usam o sapato Oxford?', 3),
('Qual acessório deve combinar com o cinto para manter harmonia visual?', 3);

-- Pergunta 1
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cinto', TRUE, 11),
('Pulseira de couro', FALSE, 11),
('Carteira', FALSE, 11);

-- Pergunta 2
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Aço inoxidável', TRUE, 12),
('Plástico', FALSE, 12),
('Silicone', FALSE, 12);

-- Pergunta 3
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lenço de lapela (pocket square)', TRUE, 13),
('Meia social', FALSE, 13),
('Gravata borboleta', FALSE, 13);

-- Pergunta 4
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Meias sociais escuras', TRUE, 14),
('Suspensórios coloridos', FALSE, 14),
('Pulseiras de metal', FALSE, 14);

-- Pergunta 5
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Sapato', TRUE, 15),
('Gravata', FALSE, 15),
('Relógio', FALSE, 15);


-- Quiz 4

INSERT INTO quiz (nome, descricao)
VALUES ('Perfumes', 'Avalie seu conhecimento sobre fragrâncias, notas e perfumaria clássica.');

INSERT INTO pergunta (texto, fk_quiz) VALUES
('O que são “notas de topo” em um perfume?', 5),
('Dentre as opções, qual desses é mais adequado para um dia quente?', 5),
('Qual é o principal componente aromático na família cítrica?', 5),
('Onde geralmente se aplica o perfume para maior fixação?', 5),
('Qual país é considerado o berço da perfumaria moderna?', 5);

-- Pergunta 1
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Notas que aparecem nos primeiros minutos após aplicar', TRUE, 21),
('Notas que duram o dia todo', FALSE, 21),
('Notas usadas apenas em perfumes femininos', FALSE, 21);

-- Pergunta 2
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cítrico e aromático', TRUE, 21),
('Oriental ambarado', FALSE, 21),
('Amadeirado intenso', FALSE, 21);

-- Pergunta 3
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Limão', TRUE, 23),
('Âmbar', FALSE, 23),
('Baunilha', FALSE, 23);

-- Pergunta 4
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Pontos de pulsação (pescoço, pulsos)', TRUE, 24),
('Roupas diretamente', FALSE, 24),
('Mãos e antebraço', FALSE, 24);

-- Pergunta 5
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('França', TRUE, 25),
('Estados Unidos', FALSE, 25),
('Itália', FALSE, 25);


-- Quiz 5

INSERT INTO quiz (nome, descricao)
VALUES ('Alfaiataria Clássica', 'Perguntas sobre trajes, tecidos e fundamentos da alfaiataria masculina.');

INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual tecido é mais recomendado para ternos de alta qualidade?', 6),
('O que define um terno “sob medida”?', 6),
('Qual é a largura mais tradicional para uma lapela de terno?', 6),
('Qual tipo de construção interna deixa o terno mais estruturado e durável?', 6),
('Qual peça é essencial em um traje formal completo (terno clássico)?', 6);


-- Pergunta 1
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lã fria', TRUE, 26),
('Poliéster', FALSE, 26),
('Viscose', FALSE, 26);


-- Pergunta 2
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Feito exatamente para as medidas do cliente', TRUE, 27),
('Produzido em tamanhos padrão (P, M, G)', FALSE, 27),
('Apenas ajustado após a compra', FALSE, 27);

-- Pergunta 3
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Entre 7 e 9 cm', TRUE, 28),
('3 cm', FALSE, 28),
('14 cm', FALSE, 28);

-- Pergunta 4
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Canvas completo', TRUE, 29),
('Termocolado simples', FALSE, 29),
('Sem forro interno', FALSE, 29);

-- Pergunta 5
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Camisa social branca', TRUE, 30),
('Jaqueta jeans', FALSE, 30),
('Sobreposição de moletom', FALSE, 30);

