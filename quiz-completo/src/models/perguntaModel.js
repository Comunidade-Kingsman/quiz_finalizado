var database = require("../database/config");

function listarIdsPerguntasDoQuiz(idQuiz) {

    var instrucaoSql = `
        SELECT 
            id_pergunta
        FROM pergunta
        WHERE fk_quiz = ${idQuiz};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function pegarPerguntaComAlternativas(idPergunta) {

    var instrucaoSql = `
        SELECT 
            p.id_pergunta,
            p.texto AS pergunta,
            a.id_resposta,
            a.texto AS alternativa,
            a.correta
        FROM pergunta p
        JOIN alternativas a 
            ON a.fk_pergunta = p.id_pergunta
        WHERE p.id_pergunta = ${idPergunta};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarPerguntasNaoRespondidas(idUsuario, idQuiz) {

    var instrucaoSql = `
        SELECT 
            p.id_pergunta,
            p.texto AS pergunta,
            a.id_resposta AS id_alternativa,
            a.texto AS alternativa
        FROM pergunta p
        JOIN alternativas a 
            ON p.id_pergunta = a.fk_pergunta
        WHERE p.fk_quiz = ${idQuiz}
          AND p.id_pergunta NOT IN (
                SELECT ru.fk_pergunta
                FROM resposta_usuario ru
                JOIN usuario_quiz uq
                    ON ru.fk_usuario_quiz = uq.id_usuario_quiz
                WHERE uq.fk_usuario = ${idUsuario}
                  AND uq.fk_quiz = ${idQuiz}
        )
        ORDER BY p.id_pergunta ASC, a.id_resposta ASC;
    `;

    console.log("Executando SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function contarPerguntasDoQuiz(idQuiz) {

    var instrucaoSql = `
        SELECT 
            COUNT(*) AS total_perguntas
        FROM pergunta
        WHERE fk_quiz = ${idQuiz};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listarIdsPerguntasDoQuiz,
    pegarPerguntaComAlternativas,
    listarPerguntasNaoRespondidas,
    contarPerguntasDoQuiz
};
