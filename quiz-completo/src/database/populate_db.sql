USE comunidade_kingsman;

-- Quiz 1

INSERT INTO quiz (nome, descricao)
VALUES ('Moda Clássica Masculina', 'Teste seus conhecimentos sobre estilo masculino atemporal e boas práticas de elegância.');

-- PERGUNTA 1
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual tecido é mais indicado para ternos de alta qualidade?', 1);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lã fria', TRUE, LAST_INSERT_ID()),
('Poliéster', FALSE, LAST_INSERT_ID()),
('Viscose', FALSE, LAST_INSERT_ID());

-- PERGUNTA 2
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual acessório é considerado indispensável em um traje formal?', 1);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Gravata', TRUE, LAST_INSERT_ID()),
('Pulseira', FALSE, LAST_INSERT_ID()),
('Boné', FALSE, LAST_INSERT_ID());

-- PERGUNTA 3
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual modelagem de camisa é a mais tradicional no estilo clássico?', 1);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Camisa com colarinho clássico (tradicional)', TRUE, LAST_INSERT_ID()),
('Camisa oversized', FALSE, LAST_INSERT_ID()),
('Camisa com gola padre', FALSE, LAST_INSERT_ID());

-- PERGUNTA 4
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual é o sapato mais formal entre as opções abaixo?', 1);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Oxford', TRUE, LAST_INSERT_ID()),
('Loafer', FALSE, LAST_INSERT_ID()),
('Tênis branco', FALSE, LAST_INSERT_ID());

-- PERGUNTA 5
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual é a regra geral para o comprimento ideal da barra da calça social?', 1);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Tocar levemente o peito do sapato', TRUE, LAST_INSERT_ID()),
('Ficar acima do tornozelo', FALSE, LAST_INSERT_ID()),
('Arrastar no chão', FALSE, LAST_INSERT_ID());



-- Quiz 2

INSERT INTO quiz (nome, descricao)
VALUES ('Sapatos Masculinos', 'Teste seus conhecimentos sobre modelos, materiais e cuidados com calçados clássicos.');

SET @quiz2_id = LAST_INSERT_ID();


-- PERGUNTA 1
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual destes sapatos é considerado o mais formal?', @quiz2_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Oxford', TRUE, LAST_INSERT_ID()),
('Mocassim', FALSE, LAST_INSERT_ID()),
('Chelsea Boot', FALSE, LAST_INSERT_ID());

-- PERGUNTA 2
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual material é mais utilizado em sapatos de alta qualidade?', @quiz2_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Couro legítimo', TRUE, LAST_INSERT_ID()),
('Camurça sintética', FALSE, LAST_INSERT_ID()),
('Plástico PU', FALSE, LAST_INSERT_ID());

-- PERGUNTA 3
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual é a principal característica de um sapato Derby?', @quiz2_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cadarços com abas abertas', TRUE, LAST_INSERT_ID()),
('Cadarços com abas fechadas', FALSE, LAST_INSERT_ID()),
('Ausência de cadarço', FALSE, LAST_INSERT_ID());

-- PERGUNTA 4
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual sapato é conhecido pelo detalhe de perfurações decorativas?', @quiz2_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Brogue', TRUE, LAST_INSERT_ID()),
('Derby liso', FALSE, LAST_INSERT_ID()),
('Loafer Penny', FALSE, LAST_INSERT_ID());

-- PERGUNTA 5
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual destes calçados é ideal para ocasiões casuais?', @quiz2_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Mocassim', TRUE, LAST_INSERT_ID()),
('Oxford preto', FALSE, LAST_INSERT_ID()),
('Wholecut', FALSE, LAST_INSERT_ID());


-- Quiz 3

INSERT INTO quiz (nome, descricao)
VALUES ('Acessórios Masculinos', 'Avalie seu conhecimento sobre acessórios essenciais do estilo clássico masculino.');

SET @quiz3_id = LAST_INSERT_ID();


-- PERGUNTA 1
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual acessório é tradicionalmente usado com trajes formais e deve ser da mesma cor do sapato?', @quiz3_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cinto', TRUE, LAST_INSERT_ID()),
('Pulseira de couro', FALSE, LAST_INSERT_ID()),
('Carteira', FALSE, LAST_INSERT_ID());

-- PERGUNTA 2
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual material é mais indicado para um relógio clássico?', @quiz3_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Aço inoxidável', TRUE, LAST_INSERT_ID()),
('Plástico', FALSE, LAST_INSERT_ID()),
('Silicone', FALSE, LAST_INSERT_ID());

-- PERGUNTA 3
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual acessório ajuda a estruturar e valorizar a lapela do paletó?', @quiz3_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lenço de lapela (pocket square)', TRUE, LAST_INSERT_ID()),
('Meia social', FALSE, LAST_INSERT_ID()),
('Gravata borboleta', FALSE, LAST_INSERT_ID());

-- PERGUNTA 4
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual item é obrigatório em trajes que usam o sapato Oxford?', @quiz3_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Meias sociais escuras', TRUE, LAST_INSERT_ID()),
('Suspensórios coloridos', FALSE, LAST_INSERT_ID()),
('Pulseiras de metal', FALSE, LAST_INSERT_ID());

-- PERGUNTA 5
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual acessório deve combinar com o cinto para manter harmonia visual?', @quiz3_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Sapato', TRUE, LAST_INSERT_ID()),
('Gravata', FALSE, LAST_INSERT_ID()),
('Relógio', FALSE, LAST_INSERT_ID());


-- Quiz 4

INSERT INTO quiz (nome, descricao)
VALUES ('Perfumes', 'Avalie seu conhecimento sobre fragrâncias, notas e perfumaria clássica.');

SET @quiz4_id = LAST_INSERT_ID();


-- PERGUNTA 1
INSERT INTO pergunta (texto, fk_quiz) VALUES
('O que são “notas de topo” em um perfume?', @quiz4_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Notas que aparecem nos primeiros minutos após aplicar', TRUE, LAST_INSERT_ID()),
('Notas que duram o dia todo', FALSE, LAST_INSERT_ID()),
('Notas usadas apenas em perfumes femininos', FALSE, LAST_INSERT_ID());

-- PERGUNTA 2
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Dentre as opções, qual desses é mais adequado para um dia quente?', @quiz4_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Cítrico e aromático', TRUE, LAST_INSERT_ID()),
('Oriental ambarado', FALSE, LAST_INSERT_ID()),
('Amadeirado intenso', FALSE, LAST_INSERT_ID());

-- PERGUNTA 3
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual é o principal componente aromático na família cítrica?', @quiz4_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Limão', TRUE, LAST_INSERT_ID()),
('Âmbar', FALSE, LAST_INSERT_ID()),
('Baunilha', FALSE, LAST_INSERT_ID());

-- PERGUNTA 4
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Onde geralmente se aplica o perfume para maior fixação?', @quiz4_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Pontos de pulsação (pescoço, pulsos)', TRUE, LAST_INSERT_ID()),
('Roupas diretamente', FALSE, LAST_INSERT_ID()),
('Mãos e antebraço', FALSE, LAST_INSERT_ID());

-- PERGUNTA 5
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual país é considerado o berço da perfumaria moderna?', @quiz4_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('França', TRUE, LAST_INSERT_ID()),
('Estados Unidos', FALSE, LAST_INSERT_ID()),
('Itália', FALSE, LAST_INSERT_ID());

-- Quiz 5

INSERT INTO quiz (nome, descricao)
VALUES ('Alfaiataria Clássica', 'Perguntas sobre trajes, tecidos e fundamentos da alfaiataria masculina.');

SET @quiz5_id = LAST_INSERT_ID();


-- PERGUNTA 1
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual tecido é mais recomendado para ternos de alta qualidade?', @quiz5_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Lã fria', TRUE, LAST_INSERT_ID()),
('Poliéster', FALSE, LAST_INSERT_ID()),
('Viscose', FALSE, LAST_INSERT_ID());

-- PERGUNTA 2
INSERT INTO pergunta (texto, fk_quiz) VALUES
('O que define um terno “sob medida”?', @quiz5_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Feito exatamente para as medidas do cliente', TRUE, LAST_INSERT_ID()),
('Produzido em tamanhos padrão (P, M, G)', FALSE, LAST_INSERT_ID()),
('Apenas ajustado após a compra', FALSE, LAST_INSERT_ID());

-- PERGUNTA 3
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual é a largura mais tradicional para uma lapela de terno?', @quiz5_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Entre 7 e 9 cm', TRUE, LAST_INSERT_ID()),
('3 cm', FALSE, LAST_INSERT_ID()),
('14 cm', FALSE, LAST_INSERT_ID());

-- PERGUNTA 4
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual tipo de construção interna deixa o terno mais estruturado e durável?', @quiz5_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Canvas completo', TRUE, LAST_INSERT_ID()),
('Termocolado simples', FALSE, LAST_INSERT_ID()),
('Sem forro interno', FALSE, LAST_INSERT_ID());

-- PERGUNTA 5
INSERT INTO pergunta (texto, fk_quiz) VALUES
('Qual peça é essencial em um traje formal completo (terno clássico)?', @quiz5_id);
INSERT INTO alternativas (texto, correta, fk_pergunta) VALUES
('Camisa social branca', TRUE, LAST_INSERT_ID()),
('Jaqueta jeans', FALSE, LAST_INSERT_ID()),
('Sobreposição de moletom', FALSE, LAST_INSERT_ID());

