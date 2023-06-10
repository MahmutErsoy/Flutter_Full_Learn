import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [CenterCircularRedProgress()],
        ),
        body: const LinearProgressIndicator());
  }
}

class CenterCircularRedProgress extends StatelessWidget {
  const CenterCircularRedProgress({
    super.key,
  });
  final redColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 10, // bu ve altta ki 2 satır istege baglı eklenir
      value: 0.9,
      backgroundColor: Colors.white,
    ));
  }
}
