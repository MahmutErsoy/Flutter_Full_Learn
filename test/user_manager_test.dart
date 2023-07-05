import 'package:flutter_full_learn/303/generic_learn..dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User Calculate ', () {
    final users = [
      GenericUser('vb', '11', 10),
      GenericUser('vb', '11', 10),
      GenericUser('vb', '11', 20),
    ];

    final result = UserManagement(AdminUser('vadmin', '1', 15, 1)).calculateMoney(users);

    final response = UserManagement(AdminUser('vadmin', '1', 15, 1)).showNames<String>(users);

    expect(result, 55);
  });
}
