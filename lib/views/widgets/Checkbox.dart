import 'package:flutter/material.dart';


class CheckboxWidget extends StatelessWidget {
  final bool uppercase;
  final bool lowercase;
  final bool numbers;
  final bool symbols;
  final Function(bool?, String) onChanged;

  const CheckboxWidget({super.key, 
    required this.uppercase,
    required this.lowercase,
    required this.numbers,
    required this.symbols,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        CheckboxListTile(
          title: const Text("Mayúsculas"),
          value: uppercase,
          activeColor: Colors.red.shade800,
          onChanged: (value) => onChanged(value, 'uppercase'),
        ),
        CheckboxListTile(
          title: const Text("Minúsculas"),
          value: lowercase,
          activeColor: Colors.red.shade800,
          onChanged: (value) => onChanged(value, 'lowercase'),
        ),
        CheckboxListTile(
          title: const Text("Números"),
          value: numbers,
          activeColor: Colors.red.shade800,
          onChanged: (value) => onChanged(value, 'numbers'),
        ),
        CheckboxListTile(
          title: const Text("Símbolos"),
          value: symbols,
          activeColor: Colors.red.shade800,
          onChanged: (value) => onChanged(value, 'symbols'),
        ),


      ]
    );
  }}