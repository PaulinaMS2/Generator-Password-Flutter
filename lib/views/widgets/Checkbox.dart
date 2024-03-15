import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  CheckboxWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  Map<String, dynamic> values = {
    'Mayúsculas': false,
    'Minúsculas': false,
    'Números': false,
    'Símbolos': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading, // Alinea la caja de verificación a la izquierda
          title: const Text("Mayúsculas"),
          value: values["Mayúsculas"],
          activeColor: Colors.red.shade800,
          onChanged: (newValue) {
            setState(() {
              values["Mayúsculas"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading, // Alinea la caja de verificación a la izquierda
          title: const Text("Minúsculas"),
          value: values["Minúsculas"],
          activeColor: Colors.red.shade800,
          onChanged: (newValue) {
            setState(() {
              values["Minúsculas"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading, // Alinea la caja de verificación a la izquierda
          title: const Text("Números"),
          value: values["Números"],
          activeColor: Colors.red.shade800,
          onChanged: (newValue) {
            setState(() {
              values["Números"] = newValue;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading, // Alinea la caja de verificación a la izquierda
          title: const Text("Símbolos"),
          value: values["Símbolos"],
          activeColor: Colors.red.shade800,
          onChanged: (newValue) {
            setState(() {
              values["Símbolos"] = newValue;
            });
          },
        ),
      ],
    );
  }
}