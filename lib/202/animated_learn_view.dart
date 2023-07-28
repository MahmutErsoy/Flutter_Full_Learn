import 'package:flutter/material.dart';

const double kZero = 0; //bazen 0'lar icin (cok kullanılıyorsa) degiskenleri  bu sekilde set edebiliriz

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller; //late atiyorsak init state anında set etmeliyiz

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow, opacity: _isOpacity ? 1 : 0, child: const Text("data")),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: const Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
              style: (_isVisible ? context.textTheme().displayLarge : context.textTheme().titleMedium) ??
                  const TextStyle(),
              duration: _DurationItems.durationLow,
              child: const Text("data")),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: _isVisible
                ? kZero
                : MediaQuery.of(context).size.width *
                    0.2, //mediaquery ile ekran boyutunun genislik ve yuksekligi alinabilri
            //context sayesinde ekranın yuzde 20'si aliniyor ama null gelen bi degerle islem yapılamayacagi icin null check yapılıyor
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
          ),
          const Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                  top: 10, curve: Curves.elasticOut, duration: _DurationItems.durationLow, child: Text("data"))
            ],
          )),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text("data");
              },
            ),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
