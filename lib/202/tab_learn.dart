import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length, // elimizle 2 3 vermek yerine bu yöntem kullanılır
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            shape: CircularNotchedRectangle(),
            child: _myTabView(),
          ),
          appBar: AppBar(
              //bottom: TabBar(controller: _tabController, tabs: [Tab(text: "Page1"), Tab(text: "Page2")]),
              ),
          body: _tabbarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.white,
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: "${e.name}")).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: NeverScrollableScrollPhysics(), // sayfayı yana kaydırma ile değiştirmeyi engeller
        controller: _tabController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.orange)
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }
