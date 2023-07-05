import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = LightColor();
  late ThemeData theme;

  LightTheme() {
    //classı kullanabilmek icin constructurda temayı yarattık
    theme = ThemeData(
        appBarTheme: AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white,
        checkboxTheme: CheckboxThemeData(
            side: BorderSide(width: 1, color: LightColor()._textColor),
            checkColor: MaterialStateProperty.all(LightColor()._textColor),
            fillColor: MaterialStateProperty.all(LightColor()._saphireSplendour)),
        buttonTheme: ButtonThemeData(
            colorScheme:
                ColorScheme.light(onPrimary: LightColor()._textColor, onSecondary: LightColor()._saphireSplendour)),
        colorScheme: ColorScheme.light(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
        textTheme:
            ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class LightColor {
  final Color _textColor = Colors.black;
  final Color _saphireSplendour = Color.fromARGB(255, 135, 40, 183);
}
