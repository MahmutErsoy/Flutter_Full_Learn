import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShareContextLearn extends StatefulWidget {
  const ShareContextLearn({super.key});

  @override
  State<ShareContextLearn> createState() => _ShareContextLearnState();
}

enum _SecureKeys { token }

class _ShareContextLearnState extends State<ShareContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
      ),
      body: TextField(
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
