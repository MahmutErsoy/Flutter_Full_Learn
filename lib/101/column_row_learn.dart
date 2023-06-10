import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // 4+2+2+2
          Expanded(
              flex: 4, // flex e 4 verdik ekranın yatay ve dikey de yüzde 40 nı kaplar.
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(
                      child: Container(
                          color:
                              Colors.green)), // expanded row ve column da kullanılır. ve row, column da kendine ayrılan
                  Expanded(child: Container(color: Colors.blue)), // alanı kaç tane expanded ona göre eş parçaya böler.
                  Expanded(child: Container(color: Colors.pink)),
                ],
              )),
          const Spacer(flex: 2),
          Expanded(
              flex: 2, // flex e 2 verdik ekranın yatay ve dikey de yüzde 20 sini  kaplar.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('a'),
                  Text('a2'),
                  Text('a3'),
                ],
              )),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: const [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                // Spacer(),
                Expanded(child: Text('data')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
