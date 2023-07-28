import 'package:flutter/material.dart';

import 'container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  final String name = "Mahmut";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scaffold samples')),
      body: const Center(child: Text('merhaba')),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.blue,
              context: context,
              builder: (context) => SizedBox(
                    height: 100,
                    child: Center(
                      child: Container(
                        decoration: ProjectContainerDecoration(),
                        child: const Text("Merhaba! Hosgeldiniz"),
                      ),
                    ),
                  ));
        },
        child: const Text("Tikla"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: ProjectContainerDecoration(),
                child: Text("Merhaba $name and your name's length is ${name.length}"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'b'),
        ]),
      ),
    );
  }
}
