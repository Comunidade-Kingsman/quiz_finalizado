var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/", function (req, res) {
  usuarioController.cadastrarUsuario(req, res);
})

router.put("/", function (req, res) {
  usuarioController.autenticar(req, res);
});

router.delete("/", function (req, res) {
  usuarioController.sair(req, res);
});

router.get("/sessao", function(req, res) {
  usuarioController.usuarioLogado(req, res);
});

module.exports = router;