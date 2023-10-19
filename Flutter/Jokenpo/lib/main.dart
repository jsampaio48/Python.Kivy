import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Jogo.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  ));
}

