import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: TextField(
          maxLength: 20,
          keyboardType: TextInputType.emailAddress, // klavye yi mail tipinde açar
          autofillHints: [AutofillHints.email],
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
            labelText: 'Mail',
            //fillColor: Colors.white,
            //filled: true,
          ),
        ),
      ),
    );
  }
}
