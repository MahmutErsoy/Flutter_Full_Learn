import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_outlined,
                  color: Theme.of(context).colorScheme.background, size: 40)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: iconSizes.iconSmall,
              )),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
