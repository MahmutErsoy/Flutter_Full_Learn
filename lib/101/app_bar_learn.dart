import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});

  final String _title = 'Welcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        //centerTitle: true,
        //backgroundColor: Colors.transparent,
        //elevation: 0,
        //systemOverlayStyle: SystemUiOverlayStyle.light,
        // actionsIconTheme: const IconThemeData(color: Colors.red, size: 45),
        // üst kısmı main dartta appBarTheme içinde yaptık. projelerde appbar lar aynı tasarımda olacağı için yaptığımız yol daha doğru.
        // automaticallyImplyLeading: false,  sayfada otomatikman back butonu gelmesin demek.
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mark_email_unread_sharp)),
          const Center(child: CircularProgressIndicator())
        ],
      ),
      body: Column(children: const []),
    );
  }
}
