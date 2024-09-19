import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Escolha do Bot",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset("images/padrao.png"),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Image.asset("images/pedra.png"),
              Image.asset("images/papel.png"),
              Image.asset("images/tesoura.png")
            ],
          )
        ],
      ),
    );
  }
}
