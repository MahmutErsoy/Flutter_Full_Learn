import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return Colors.green;
            })),
            child: Text('Save',
                style: Theme.of(context).textTheme.titleMedium), //style ı boyle kullanmamız en iyi yol denilebilir
          ),
          const ElevatedButton(onPressed: null, child: Text('data')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
          FloatingActionButton(
              onPressed: () {
                // servise istek at
                //sayfanın rengini duzenle
              },
              child: const Icon(Icons.add)),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.all(10)),
              child: const SizedBox(width: 200, child: Text('data'))),
          InkWell(
              onTap: () {}, child: const Text('custom')), //inkwell ile widgetlara tıklanma ozelligi kazandırabiliriz.
          //inkwell widget ile widgetlar sarmalanarak widgetlara tıklanabilme ozelligi kazandırılabilir.
          Container(
            height: 150,
            color: Colors.white,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
                child: Text(
                  'Place Bid',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ))
        ],
      ),
    );
  }
}
