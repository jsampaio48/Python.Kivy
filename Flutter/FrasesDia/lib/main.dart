import 'dart:math';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
    const Home({super.key});
    @override
    State<Home> createState() => _HomeState();
  }
  
class _HomeState extends State<Home> {
  String _fraseGerada = "Clique abaixo para gerar uma frase!";
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    if (_data.length == 0){
      final rawData = await rootBundle.loadString("assets/arquivos/frases.txt");
      List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
      //print(listData[0][0]);
      setState(() {
      _data = listData;
      });
    }
    _proximaFrase();

  }

  void _proximaFrase(){
    int _numeroSorteado = Random().nextInt(_data.length);

    setState(() {
      _fraseGerada = _data[_numeroSorteado].toString().replaceAll('[', '').replaceAll(']', '');
      //print(_fraseGerada);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("W  I  T",),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.orangeAccent)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_frases.png'),
            Text(_fraseGerada,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.orange
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shadowColor: Colors.black
              ),
              onPressed: _loadCSV,
              child: Text("Nova Frase"),

            )
          ],
        ),
      ),
    );
  }
}

