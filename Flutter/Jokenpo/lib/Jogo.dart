import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _imagemApp = Image.asset("assets/images/padrao.png");
  int _scoreUsuario = 0;
  int _scoreApp = 0;
  String _mensagem = "";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    int numero = Random().nextInt(3);
    String escolhaApp = opcoes[numero];

    //Exibicao da imagem escolhida pelo App
    switch(escolhaApp){
      case "pedra":
        setState(() {this._imagemApp = Image.asset("assets/images/pedra.png");});
        break;
      case "papel":
        setState(() {this._imagemApp = Image.asset("assets/images/papel.png");});
        break;
      case "tesoura":
        setState(() {this._imagemApp = Image.asset("assets/images/tesoura.png");});
        break;
    }

    //Verificar o resultado do jogo
    //Usuário ganha
    if (
      (escolhaUsuario == "pedra"   && escolhaApp == "tesoura" ) ||
      (escolhaUsuario == "papel"   && escolhaApp == "pedra"   ) ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel"   )){
        setState(() {
          this._scoreUsuario ++;
          this._mensagem = "Parabéns!!! Você ganhou! :)";
        });
    //App ganha
    }else if (
      (escolhaApp == "pedra"   && escolhaUsuario == "tesoura" ) ||
      (escolhaApp == "papel"   && escolhaUsuario == "pedra"   ) ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel"   )){
        setState(() {
          this._scoreApp ++;
          this._mensagem = "Que pena!!! Você Perdeu! :(";
        });
    //Empate
    }else {
      setState(() {
        this._mensagem = "Empatamos!!!";
      });
    }
    if(this._scoreUsuario == 10 || this._scoreUsuario == 10) {
      this._scoreApp = 0;
      this._scoreUsuario = 0;
      if (this._scoreUsuario == 10) {
        setState(() {
          this._mensagem = "Final de partida!!! Você foi o vencedor!!!";
        });
      } else {
        setState(() {
          this._mensagem = "Final de partida!!! o App foi o vencedor!!!";
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text("Escolha do App", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Image(image: this._imagemApp.image, height: 100,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/usuario.png", height: 70,),
              Text(this._scoreUsuario.toString(), textAlign: TextAlign.center,style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Image.asset("assets/images/versus.png", height: 50,),
              Text(this._scoreApp.toString(), textAlign: TextAlign.center,style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Image.asset("assets/images/robo.png", height: 70,),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha uma opção abaixo", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () => _opcaoSelecionada("pedra"), child: Image.asset("assets/images/pedra.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("papel"), child: Image.asset("assets/images/papel.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("tesoura"), child: Image.asset("assets/images/tesoura.png", height: 100,),),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: Text(this._mensagem, textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
