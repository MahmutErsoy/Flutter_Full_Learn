import 'package:flutter/material.dart';

//statless widget eger ekranda herhangi bir yasam yoksa kullanılır
//her sey widgetlastirilmali

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  final String text2 = "veli";
  final String text3 = "veli2";
  final String text4 = "veli3";
  final String text5 = "veli4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(text: text2),
          TitleTextWidget(text: text3),
          _emptyBox(),
          TitleTextWidget(text: text4),
          _emptyBox(),
          TitleTextWidget(text: text5),
          const _CustomContainer(),
          _emptyBox()
        ],
      ),
    );
  } // ekranımızı build metodu icinde gelistiririz

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
