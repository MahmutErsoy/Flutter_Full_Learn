import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constants/duration_items.dart';
import 'package:flutter_full_learn/product/constants/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LotieLearn extends StatefulWidget {
  const LotieLearn({super.key});

  @override
  State<LotieLearn> createState() => _LotieLearnState();
}

class _LotieLearnState extends State<LotieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              controller.animateTo(isLight ? 0.5 : 1);
              context.read<ThemeNotifier>().changeTheme();
              isLight = !isLight;
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
      ),
      body: LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });

  final _loadingLottie = 'https://lottie.host/8e40d047-44ad-4c88-896e-872a3d59ba86/NAAkr9aNGR.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
