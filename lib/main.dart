import 'package:flutter/material.dart';
import 'package:generador_password/views/widgets/textPassword.dart';
import 'package:generador_password/views/widgets/Checkbox.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CheckboxWidget(),
              
              
      ),
    );
  }
}
