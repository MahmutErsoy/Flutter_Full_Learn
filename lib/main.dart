import 'package:flutter/material.dart';

import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '303/lottie_learn.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      /*ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(labelColor: Colors.white),
          bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          //cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.red,
            elevation: 0,
          )),*/
      home: const LotieLearn(),
    );
  }
}
