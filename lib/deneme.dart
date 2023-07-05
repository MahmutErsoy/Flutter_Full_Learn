import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class deneme extends StatelessWidget {
  const deneme({super.key});

  final _title = 'Create your first meal';
  final _description = 'Add a meal ';
  final String text = "Import Meal";
  final String text2 = "Create A Meal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            const SizedBox(height: 300, child: PngImage(name: "plate")),
            SizedBox(height: ButtonHeights.imageNormalHHeight),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(title: _description * 10),
            ),
            const Spacer(),
            _createButton(context),
            TextButton(
              onPressed: () {},
              child: Text(text),
            ),
            SizedBox(height: ButtonHeights.buttonNormalHeight)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeights.buttonNormalHeight,
        child: Center(
          child: Text(
            text2,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 30));
  }
}

class PaddingItems {
  static EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 10.0);
  static EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20.0);
}

class ButtonHeights {
  static double buttonNormalHeight = 50;
  static double imageNormalHHeight = 20;
}
