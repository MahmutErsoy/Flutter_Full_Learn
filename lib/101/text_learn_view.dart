import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final String name = 'mahmut';

  final String? userName;

  final ProjectKeys keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ('Welcome $name and name length is ${name.length}' * 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                wordSpacing: 2,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                letterSpacing: 2, // text style ı bu şekilde kullanmak sağlıklı değil
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),

          Text(
            ('Hello $name ${name.length}'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, // style ı böyle kullanmak üstte ki yönteme göre daha iyi
            style: ProjectStyles.welcomeStyle,
          ),

          Text(
            ('Hello $name ${name.length}'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ProjectColors.welcomeColor), // bu yöntem üstte ki 2 yönteme göre daha iyi
          ),
          Text(userName ?? ''), //null safety kullanılıyor. surname null ise bosluk koy.
          Text(keys.welcome),
        ],
      )),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      letterSpacing: 2,
      color: Colors.lime,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
