
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generador_password/views/widgets/checkbox.dart';
import 'package:generador_password/views/widgets/length_password_text.dart';
import 'package:generador_password/views/widgets/slider_length.dart';
import 'package:generador_password/models/create_password.dart';

class GeneratorPassword extends StatefulWidget {
  const GeneratorPassword({Key? key}) : super(key: key);

  @override
  _GeneratorPasswordState createState() => _GeneratorPasswordState();
}

class _GeneratorPasswordState extends State<GeneratorPassword> {
  final TextEditingController _lengthController = TextEditingController();
  double _passwordLength = 1;

  Map<String, dynamic> values = {
    'uppercase': false,
    'lowercase': false,
    'numbers': false,
    'symbols': false,
    'tipePassword': false
  };

  String _generatedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generador de contraseñas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade800,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            readOnly: false,
                            decoration: const InputDecoration(
                              labelText: "Contraseña Generada",
                              border: OutlineInputBorder(),
                            ),
                            controller:
                                TextEditingController(text: _generatedPassword),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _copyToClipboard();
                            },
                            icon: const Icon(Icons.content_copy),
                            label: const SizedBox.shrink(),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.zero),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: PasswordLengthTextField(
                            controller: _lengthController,
                            onChanged: (String value) {
                              setState(() {
                                _passwordLength = int.parse(value).toDouble();
                                _generatedPassword = _generatePassword();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: PasswordLengthSlider(
                            passwordLength: _passwordLength,
                            onChanged: (double value) {
                              setState(() {
                                _passwordLength = value.toDouble();
                                _lengthController.text = value.toInt().toString();
                                _generatedPassword = _generatePassword();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RadioListTile(
                      title: const Text("Fácil de decir"),
                      value: true,
                      groupValue: values['tipePassword'],
                      activeColor: Colors.red.shade800,
                      onChanged: (value) {
                        setState(() {
                          values['tipePassword'] = value;
                          if (values['tipePassword']) {
                            values['uppercase'] = true;
                            values['lowercase'] = true;
                            values['numbers'] = false;
                            values['symbols'] = false;
                            _generatedPassword = _generatePassword();
                          }
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Todos los caracteres"),
                      value: false,
                      groupValue: values['tipoContrasenia'],
                      activeColor: Colors.red.shade800,
                      onChanged: (value) {
                        setState(() {
                          values['tipePassword'] = value;
                          if (!values['tipePassword']) {
                            values['uppercase'] = true;
                            values['lowercase'] = true;
                            values['numbers'] = true;
                            values['symbols'] = true;
                            _generatedPassword = _generatePassword();
                          }
                        });
                      },
                    ),
                    CheckboxWidget(
                      uppercase: values['uppercase'],
                      lowercase: values['lowercase'],
                      numbers: values['numbers'],
                      symbols: values['symbols'],
                      onChanged: (bool? value, String option) {
                        setState(() {
                          values[option] = value!;
                          _generatedPassword = _generatePassword();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contraseña copiada al portapapeles')),
    );
  }

  String _generatePassword() {
    setState(() {
      _generatedPassword = createPassword(
        length: _passwordLength,
        includeUppercase: values['uppercase'],
        includeLowercase: values['lowercase'],
        includeNumbers: values['numbers'],
        includeSymbols: values['symbols'],
      );
    });
    return _generatedPassword;
  }
}