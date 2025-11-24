var quizModel = require("../models/quizModel");


function listarQuizzes(req, res) {
    quizModel.listarQuizzes()
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao listar quizzes:", erro);
            res.status(500).json({ msg: "Erro ao listar quizzes." });
        });
}


function iniciarQuiz(req, res) {
    var idUsuario = req.session.idUsuario;
    var idQuiz = req.params.idQuiz;

    if (!idUsuario) {
        res.status(401).json({ msg: "O usuário não está logado." });
        return;
    }
    if (!idQuiz) {
        res.status(400).json({ msg: "idQuiz não informado." });
        return;
    }

    // Verifica se o quiz existe
    return quizModel.buscarQuizPorId(idQuiz)
        .then((dadosQuiz) => {

            if (dadosQuiz.length === 0) {
                res.status(409).json({ msg: "Quiz inexistente." });
                return Promise.reject("QUIZ_INEXISTENTE");
            }

            req.session.idQuizSelecionado = Number(idQuiz);

            // Verifica se o usuario já iniciou o quiz
            return quizModel.buscarUsuarioQuiz(idUsuario, idQuiz);
        })
        .then((usuarioQuiz) => {

            if (usuarioQuiz.length > 0) {
                res.status(200).json({
                    msg: "O usuário já iniciou este quiz anteriormente."
                });
                return Promise.reject("JA_EXISTE");
            }

            // Insere o registro
            return quizModel.iniciarQuiz(idUsuario, idQuiz);
        })
        .then(() => {
            res.status(200).json({
                msg: "O início do quiz pelo usuário foi registrado com sucesso."
            });
        })
        .catch(erro => {
            if (erro === "JA_EXISTE" || erro === "QUIZ_INEXISTENTE") return;

            console.log("Erro ao iniciar o quiz:", erro);
            res.status(500).json({ erro });
        });
}

var database = require("../database/config");


module.exports = {
    iniciarQuiz,
    listarQuizzes
};
