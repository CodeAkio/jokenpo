import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      this._imagemApp = AssetImage("assets/images/${escolhaApp}.png");
    });

    if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
      return;
    }

    if (
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });
    } else {
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: this._imagemApp),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset("assets/images/pedra.png", height: 100),
                  onTap: () => _opcaoSelecionada("pedra"),
                ),
                GestureDetector(
                  child: Image.asset("assets/images/papel.png", height: 100),
                  onTap: () => _opcaoSelecionada("papel"),
                ),
                GestureDetector(
                  child: Image.asset("assets/images/tesoura.png", height: 100),
                  onTap: () => _opcaoSelecionada("tesoura"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
