var database = require("../database/config");


function registrarResposta(idUsuarioQuiz, idPergunta, idResposta) {

    var instrucaoSql = `
        INSERT INTO resposta_usuario (fk_usuario_quiz, fk_pergunta, fk_resposta)
        VALUES (${idUsuarioQuiz}, ${idPergunta}, ${idResposta});
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
  registrarResposta
};