import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn..dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    List<GenericUser> users = [
      GenericUser('vb1', '11', 10),
      GenericUser('vb2', '11', 10),
      GenericUser('vb3', '11', 20),
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();

    try {
      final response = users.singleWhere(
        (element) => element.findUserName('vb1'),
        orElse: () {
          return GenericUser('name', 'id', 15);
        },
      );

      print(response.name);
    } catch (e) {
      print(e);
    }

    print('${users.where((element) => element.money > 5)}');
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      GenericUser('vb1', '11', 10),
      GenericUser('vb2', '11', 10),
      GenericUser('vb3', '11', 20),
    ];

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('x'),
    );

    print(response);
  });
}
