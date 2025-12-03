// ADICIONEI COMENTÁRIOS NESSE ARQUIVO PARA ESTUDO POSTERIOR
var usuarioModel = require("../models/usuarioModel");
// FUNÇÃO DO CONTROLLER:
// Lógica, validação, chama o Model, autentica a sessão do usuário, envio de respostas 

function usuarioLogado(req, res) {
    //verifica se o usuário está logado 
    if (!req.session.idUsuario) {
        res.status(401).json({
            msg: "O usuário não está logado."
        });
        return;
    }
    res.status(200).json({
        msg: "Usuário logado."
    });
    return;
}

function autenticar(req, res) {
    // verifica o login, pega o email e a senha do body da requisição 
    var email = req.body.email;
    var senha = req.body.senha;

    if (!email || !senha) {
        res.status(400).json({
            msg: "É necessário informar o e-mail e a senha."
        });
        return;
    }

    usuarioModel.autenticar(email, senha) //pede para a Model verificar se os dados estão no banco 
    .then(
        function (resultadoAutenticar) {
            
            if (resultadoAutenticar.length == 1) {
                console.log(resultadoAutenticar); //verifica se o banco de dados retornou 1 (uma linha), que significa que bateu no banco de dados (login ok)
                
                req.session.idUsuario = resultadoAutenticar[0].id_usuario; //índice 0 é o id do usuário
                
                res.status(200).json({
                    msg: "Login realizado com sucesso."
                });
                return;
            }
            res.status(403).json({
                msg: "Email e/ou senha inválido(s)"
            });
            return;
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        }
    );
    
}

function sair(req, res) {
    //Destrói a sessão no servidor 
    req.session.destroy((error) => {
        if (error) res.status(500).json(error);
		res.status(200).json({ msg: "Usuário deslogado com sucesso." });
        return;
	});
}

function cadastrarUsuario(req, res) {
    //extrai os dados 
    var nome = req.body.nome;
    var email = req.body.email;
    var senha = req.body.senha;
    
    //validações iniciais
    if (!nome) {
        res.status(400).send("nome não informado!");
        return;
    }
    if (!email) {
        res.status(400).send("email não informado!");
        return;
    }
    if (!senha) {
        res.status(400).send("senha não informada!");
        return;
    }
    
    //verifica se o email já existe antes
    usuarioModel.buscarUsuarioPorEmail(email).then((dados) => { //resposta que o BuscarUsuarioPorEmail pega no Model vira o "dados"
        emailJaCadastrado = dados.length > 0;
        if (emailJaCadastrado) {
            res.status(409).json({
                msg: "Não foi possível realizar o cadastro. Já existe um usuário cadastrado com este e-mail."
            });
            return;
        }
        
        usuarioModel.cadastrarUsuario(
            nome,
            email,
            senha
        )
        .then((resultado) => {
            res.status(201).json({
                msg: "Usuário cadastrado com sucesso"
            });
            return;
        }).catch((erro) => {
            console.log(erro);
            console.log(
                "\nHouve um erro ao realizar o cadastro! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
            return;
        });

    });
}



module.exports = {
    usuarioLogado,
    autenticar,
    cadastrarUsuario,
    sair
}