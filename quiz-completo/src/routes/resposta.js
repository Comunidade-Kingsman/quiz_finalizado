var express = require("express");
var router = express.Router();

var respostaController = require("../controllers/respostaController");

router.post("/", function (req, res) {
    respostaController.registrarResposta(req, res);
});

router.get("/resultado", function (req, res) {
    respostaController.resultadoRespostas(req, res);
});

module.exports = router;