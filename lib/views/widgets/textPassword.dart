import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CopyTextField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.content_copy),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: _textEditingController.text));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Copiado!')),
            );
          },
        ),
      ],
    );
  }
}