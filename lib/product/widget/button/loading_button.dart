import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.title, required this.onPressed});

  final String title;
  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (_isLoading) return; // işlem varken tıklamayı almaması için
          _changeLoading();
          await widget.onPressed.call();
          _changeLoading();
        },
        child: _isLoading ? const CircularProgressIndicator() : Text(widget.title));
  }
}
