var database = require("../database/config");

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
    totalAcertosDoUsuarioNoQuiz
};
