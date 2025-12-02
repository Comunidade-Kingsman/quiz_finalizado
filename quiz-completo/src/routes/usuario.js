// ADICIONEI COMENTÁRIOS NESSE ARQUIVO PARA ESTUDO POSTERIOR

var express = require("express"); //importa o framework Express
var router = express.Router(); // "mini-express" específico para esse módulo. Como o Express, mas dedicado apenas para as rotas do "usuário"

var usuarioController = require("../controllers/usuarioController"); //importa o controller que será requisitado caso a rota seja acessada

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/", function (req, res) {
  usuarioController.cadastrarUsuario(req, res); //repassa TUDO para o controller
})

router.put("/", function (req, res) { //express "cola" o pedaço de caminho do app.js com esse "/", e ja é definido que tudo nesse arquivo começa com /usuario
  usuarioController.autenticar(req, res);
});

router.delete("/", function (req, res) {
  usuarioController.sair(req, res);
});

router.get("/sessao", function(req, res) {
  usuarioController.usuarioLogado(req, res);
});

module.exports = router; //conecta com a variável usuarioRouter do app.js