import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _mensagem = "";

  void _calcular(){
    String _resultado = "";
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      setState(() {
        _mensagem = "Valores inválidos, digite números maiores que zero utilizando ponto.";
      });
    }else{
      if(precoAlcool / precoGasolina >= 0.7){
        setState(() {
          _mensagem = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _mensagem = "Melhar abastecer com álcool";
        });
      }
      //_limparCampos();
    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,

      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.all(32), child: Image.asset("assets/images/combustivel.png", height: 90,),),
                Padding(padding: EdgeInsets.all(20), child: Text("Saiba qual a melhor opção para abastecer o seu veículo.", textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold) ),),
                TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Preço Álcool (ex.: 1.99)"), style: TextStyle(fontSize: 20), controller: _controllerAlcool,),
                TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Preço Gasolina( ex.: 4.99)"), style: TextStyle(fontSize: 20), controller: _controllerGasolina,),
                Padding(padding: EdgeInsets.only(top: 10),child: TextButton(child: Text("Calcular"),onPressed: _calcular, style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((state) => Colors.blue), foregroundColor: MaterialStateProperty.resolveWith((state) => Colors.white), ), ),),
                Padding(padding: EdgeInsets.all(20), child: Text(_mensagem, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),),
              ],
            ),
        ),
      ),
    ) ;
  }
}
