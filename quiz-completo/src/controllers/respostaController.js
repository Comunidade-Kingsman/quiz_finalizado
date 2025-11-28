var quizModel = require("../models/quizModel");
var respostaModel = require("../models/respostaModel");
var perguntaModel = require("../models/perguntaModel");
var respostaUsuarioModel = require("../models/respostaUsuarioModel");


function registrarResposta(req, res) {
    var idUsuario = req.session.idUsuario;
    var idQuiz = req.session.idQuizSelecionado;
    var idPergunta = req.session.idPergunta;
    var idResposta = req.body.idResposta;

    if (!idUsuario) {
        return res.status(401).json({
            msg: "O usuário não está logado."
        });
    }
    if (!idQuiz) {
        return res.status(409).json({
            msg: "Nenhum quiz foi selecionado."
        });
    }
    if (!idPergunta) {
        return res.status(409).json({
            msg: "Nenhuma pergunta foi escolhida."
        });
    }
    if (!idResposta) {
        return res.status(400).json({
            msg: "Nenhuma resposta fornecida."
        });
    }

    idResposta = Number(idResposta);

    quizModel.buscarUsuarioQuiz(idUsuario, idQuiz)
        .then((dados) => {

            if (!dados || dados.length === 0) {
                return Promise.reject("USUARIO_QUIZ_NAO_ENCONTRADO");
            }

            var idUsuarioQuiz = dados[0].id_usuario_quiz;

            return respostaModel.registrarResposta(idUsuarioQuiz, idPergunta, idResposta);
        })
            .then(() => {
            // 2. VERIFICA se o quiz terminou, listando perguntas restantes
            return perguntaModel.listarPerguntasNaoRespondidas(idUsuario, idQuiz);
        })
            .then((perguntasRestantes) => {
            // 3. DECIDE o status e envia para o front-end
            if (perguntasRestantes.length === 0) {
                res.status(200).json({ statusQuiz: "FINALIZADO", mensagem: "Última resposta registrada!" });
            } else {
                res.status(200).json({ statusQuiz: "CONTINUAR", mensagem: "Resposta registrada com sucesso!" });
            }
        })
        .catch((erro) => {
            if (erro === "USUARIO_QUIZ_NAO_ENCONTRADO") {
                return res.status(500).json({ erro: "Erro: relação usuario_quiz não encontrada." });
            }

            console.log("Erro ao registrar resposta:", erro);
            return res.status(500).json(erro);
        });
}


function resultadoRespostas(req, res) {
    var idUsuario = req.session.idUsuario;
    var idQuiz = req.session.idQuizSelecionado;

    if (!idUsuario) {
        res.status(401).json({
            msg: "O usuário não está logado."
        });
        return;
    }
    if (!idQuiz) {
        res.status(409).json({
            msg: "Nenhum quiz foi selecionado."
        });
        return;
    }

    // Busca o total de perguntas do quiz
    perguntaModel.contarPerguntasDoQuiz(idQuiz)
        .then(function (resultadoTotalPerguntas) {

            var totalPerguntas = resultadoTotalPerguntas[0].total_perguntas;

            // Busca o total de acertos do usuário
            return respostaUsuarioModel.totalAcertosDoUsuarioNoQuiz(idUsuario, idQuiz)
                .then(function (resultadoAcertos) {

                    var totalAcertos = resultadoAcertos[0].total_acertos;
                    var totalErros = totalPerguntas - totalAcertos;

                    // Calcula o percentual de acertos e erros
                    var percentualAcertos = ((totalAcertos / totalPerguntas) * 100).toFixed(2);
                    var percentualErros = ((totalErros / totalPerguntas) * 100).toFixed(2);

                    // Mensagem personalizada de desempenho
                    var mensagemDesempenho = "";

                    if (percentualAcertos >= 80) {
                        mensagemDesempenho = "Excelente! Seu conhecimento está muito bom!";
                    } else if (percentualAcertos >= 50) {
                        mensagemDesempenho = "Você está no caminho certo! Mas ainda há espaço para melhorar.";
                    } else {
                        mensagemDesempenho = "Você precisa estudar um pouco mais sobre o conteúdo.";
                    }

                    // Enviar resposta final
                    res.status(200).json({
                        totalPerguntas: totalPerguntas,
                        totalAcertos: totalAcertos,
                        totalErros: totalErros,
                        percentualAcertos: Number(percentualAcertos),
                        percentualErros: Number(percentualErros),
                        mensagemDesempenho: mensagemDesempenho
                    });
                    return;

                });
        })
        .catch(function (erro) {
            console.log("Erro ao gerar resultado:", erro);
            res.status(500).json(erro);
            return;
        });
}



module.exports = {
    registrarResposta,
    resultadoRespostas
}