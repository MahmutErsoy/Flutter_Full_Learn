import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isSecure = true;

  void _changeVisibility() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: widget.controller,
          autofillHints: const [AutofillHints.password],
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isSecure, // girilen text gözükmez
          decoration:
              InputDecoration(border: const UnderlineInputBorder(), hintText: "Password", suffix: _onVisibilityIcon()),
        ),
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeVisibility();
        },
        icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off));
  }
}
