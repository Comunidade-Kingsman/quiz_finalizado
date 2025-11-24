var perguntaModel = require("../models/perguntaModel");


function pegaPerguntaDoQuiz(req, res) {
    var idUsuario = req.session.idUsuario;
    var idQuiz = req.session.idQuizSelecionado;

    if (!idUsuario) {
        res.status(401).json({ msg: "O usuário não está logado." });
        return;
    }
    if (!idQuiz) {
        res.status(400).json({ msg: "idQuiz não informado." });
        return;
    }

    perguntaModel.listarPerguntasNaoRespondidas(idUsuario, idQuiz)
        .then((linhas) => {

            if (linhas.length === 0) {
                res.status(200).json({ msg: "Quiz finalizado!" });
                return;
            }

            // Agrupar a primeira pergunta não respondida
            var primeiraPerguntaId = linhas[0].id_pergunta;

            // Filtra todas as linhas dessa pergunta
            var linhasPergunta = linhas.filter(l => l.id_pergunta === primeiraPerguntaId);

            var idPergunta = linhasPergunta[0].id_pergunta;

            var resposta = {
                id_pergunta: idPergunta,
                pergunta: linhasPergunta[0].pergunta,
                alternativas: linhasPergunta.map(l => ({
                    id_alternativa: l.id_alternativa,
                    alternativa: l.alternativa
                }))
            };

            req.session.idPergunta = idPergunta;

            res.status(200).json(resposta);
        })
        .catch((erro) => {
            console.log("Erro ao buscar pergunta:", erro);
            res.status(500).json({ erro });
        });
}



module.exports = {
    pegaPerguntaDoQuiz
}