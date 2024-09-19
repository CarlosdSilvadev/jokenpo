import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = AssetImage("images/padrao.png");
  var mensagem = "Escolha uma opção abaixo";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];

    var numero = Random().nextInt(3);

    var escolhaApp = opcoes[numero];

    print("escolha do bot $escolhaApp");
    print("escolha do usuario $escolhaUsuario");

    //exibição da imagem escolhida pelo bot
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          imagemApp = AssetImage("images/pedra.png");
        });
      case "papel":
        setState(() {
          imagemApp = AssetImage("images/papel.png");
        });
      case "tesoura":
        setState(() {
          imagemApp = AssetImage("images/tesoura.png");
        });
    }

    //validação usuari vencedor
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        mensagem = "Você ganhou";
      });
      //validação usuario perdedor
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "pedra")) {
      setState(() {
        mensagem = "Você perdeu";
      });
    } else {
      setState(() {
        mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Jokenpo",
          style: TextStyle(color: Color.fromARGB(239, 235, 229, 229)),
        ),
        backgroundColor: Color.fromRGBO(32, 15, 187, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Escolha do Bot",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: imagemApp,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 70,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 70,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 70,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
