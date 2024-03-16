import 'package:flutter/material.dart';
import 'package:generador_password/views/generator_password.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GeneratorPassword()
              
              
      ),
    );
  }
}
