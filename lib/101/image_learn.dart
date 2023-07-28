import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  final String _imagePath =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl_OHAl1Fhpx0f2XG2a7ofm-yCXFCVeGhsAg&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 300,
            child: PngImage(name: ImageItems().appleBookWithoutPath),
          ),
          Image.network(
            _imagePath,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.abc_outlined),
          )
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/png/apple_with_book.png";
  final String appleBook = "assets/png/apple_on_the_book.png";
  final String appleBookWithoutPath = "apple_on_the_book";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});

  final String name;

  String get _nameWithPath => 'assets/png/$name.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }
}
