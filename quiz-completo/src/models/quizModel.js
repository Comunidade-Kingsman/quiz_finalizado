var database = require("../database/config");


function listarQuizzes() {

    var instrucaoSql = `
        SELECT 
            id_quiz,
            nome,
            descricao
        FROM quiz;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarQuizPorId(idQuiz) {
    var instrucaoSql = `
        SELECT 
            id_quiz,
            nome,
            descricao
        FROM quiz
        WHERE id_quiz = ${idQuiz};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function iniciarQuiz(idUsuario, idQuiz) {
    var instrucaoSql = `
        INSERT INTO usuario_quiz (fk_usuario, fk_quiz)
        VALUES (${idUsuario}, ${idQuiz});
    `;

    console.log("Executando SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarUsuarioQuiz(idUsuario, idQuiz) {

    var instrucaoSql = `
        SELECT 
            id_usuario_quiz,
            fk_usuario,
            fk_quiz,
            data_inicio,
            data_fim
        FROM usuario_quiz
        WHERE fk_usuario = ${idUsuario}
          AND fk_quiz = ${idQuiz}
        ORDER BY id_usuario_quiz DESC
        LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function totalAcertosDoUsuarioNoQuiz(idUsuario, idQuiz) {

    var instrucaoSql = `
        SELECT 
            COUNT(*) AS total_acertos
        FROM resposta_usuario ru
        JOIN usuario_quiz uq 
            ON ru.fk_usuario_quiz = uq.id_usuario_quiz
        JOIN alternativas a
            ON ru.fk_resposta = a.id_resposta
        WHERE uq.fk_usuario = ${idUsuario}
          AND uq.fk_quiz = ${idQuiz}
          AND a.correta = 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listarQuizzes,
    buscarQuizPorId,
    iniciarQuiz,
    buscarUsuarioQuiz,
    totalAcertosDoUsuarioNoQuiz
};
