import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: "a");
  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..id = 2;
    user1.body = "hello";

    final user2 = PostModel2(1, 2, "b", "a");
    user2.body = "a"; // classda final kullanmadığımız için değişiklik yapılıyor.

    final user3 = PostModel3(4, 3, "ba", "av");
    // user3.body = "a"; // yapamayız çünkü model learnde class da özellikleri final verdik.

    // local de işlem yapıyor, localde kodlarını güncelliyorsan bu yöntemler daha uygun
    final user4 = PostModel4(userId: 1, id: 2, title: "a", body: "b");
    // user4.body = "a"; hata verir

    final user5 = PostModel5(userId: 1, id: 2, title: "a", body: "b");
    //user5. yaparsak özellikler çıkmaz çünkü en başta private yaptık. Model learn de private i encapsulate yaparsak özellikler buraya gelir.

    final user6 = PostModel6(userId: 1, id: 2, title: "a", body: "b");
    // post model 5 ile aynı durum

    final user7 = PostModel7();

    // servisten data çekiyorsan en mantıklısı bu
    final user8 = PostModel8(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: "me");
            user9.updateBody("mahmut");
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? "Not have any data"),
      ),
    );
  }
}
