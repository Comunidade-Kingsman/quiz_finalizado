var express = require("express");
var router = express.Router();

router.get("/", function (req, res) {
    res.render("index");
});

// "serve" a página inicial ao usuário ao acessar a url
module.exports = router;