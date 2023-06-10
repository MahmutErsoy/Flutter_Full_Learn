import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          print(index);
          return Column(
            children: [
              const Placeholder(
                color: Colors.red,
              ),
              Text('$index'),
            ],
          );
        },
      ),
    );
  }
}
