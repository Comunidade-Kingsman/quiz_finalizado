var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/", function (req, res) {
    quizController.listarQuizzes(req, res);
});

router.get("/selecionar/:idQuiz", function (req, res) {
    quizController.iniciarQuiz(req, res);
})

module.exports = router;