import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgrounColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgrounColor,
      body: Center(
        child: TextButton(
            onPressed: () {
              showCustomSheet(context, const ListViewLearn());
            },
            child: const Text("Show")),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
              context: context,
              // backgroundColor: Colors.red,
              // barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true, // height vermeden sadece bunu kullanırsan tüm sayfayı kaplar
              builder: (context) {
                return _CustomSheet(backgrounColor: _backgrounColor);
              },
            );
            if (result is bool) {
              setState(() {
                _backgrounColor = Colors.cyan;
              });
            }
          },
          child: const Icon(Icons.share)),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
    required Color backgrounColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgrounColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          _backgrounColor, // container da kullandığım color yukarıda verdiğim radius u eziyor. Radius u görmek için remove widget yap.
      child: SafeArea(
        child: Padding(
          // height: MediaQuery.of(context).size.height * 0.9, // sayfanın yüzde 90 sınını kaplar. sizedbox widget içinde kullanılır.
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Divider(
                    color: Colors.black26,
                    thickness: 3,
                    indent:
                        MediaQuery.of(context).size.width * 0.45, //indent çizgiye soldan verdiğim kadar boşluk verir
                    endIndent:
                        MediaQuery.of(context).size.width * 0.45, //endindent çizgiye sağdan verdiğim kadar boşluk verir
                  ),
                  Positioned(
                      right: 0,
                      height: 5,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.black))
                ],
              ),
              const Text("data", style: TextStyle(color: Colors.black)),
              Image.network('https://picsum.photos/200', height: 200),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _backgrounColor = Colors.amber;
                    });
                    Navigator.of(context).pop<bool>(true);
                  },
                  child: const Text('OK'))
            ],
          ),
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      context: context,
      // backgroundColor: Colors.red,
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      //isScrollControlled: true, // height vermeden sadece bunu kullanırsan tüm sayfayı kaplar
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  _CustomMainSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Color _backgrounColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          _backgrounColor, // container da kullandığım color yukarıda verdiğim radius u eziyor. Radius u görmek için remove widget yap.
      child: SafeArea(
        child: Padding(
          // height: MediaQuery.of(context).size.height * 0.9, // sayfanın yüzde 90 sınını kaplar. sizedbox widget içinde kullanılır.
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [const _BaseSheetHeader(), Expanded(child: child)],
          ),
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: Colors.black26,
          thickness: 3,
          indent: MediaQuery.of(context).size.width * 0.45, //indent çizgiye soldan verdiğim kadar boşluk verir
          endIndent: MediaQuery.of(context).size.width * 0.45, //endindent çizgiye sağdan verdiğim kadar boşluk verir
        ),
        Positioned(
            right: 0,
            height: 5,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                color: Colors.black))
      ],
    );
  }
}
