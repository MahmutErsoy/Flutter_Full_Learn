import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});

  final String message; //widgetin parametre olarak name almasını saglarız

  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    //init stateten sonra calisir ekrani cizmeden once calisir
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('b');
  }

  @override
  void dispose() {
    //sayfada cilkildigi anda cagrilir
    super.dispose();
    print('alo');
  }

  @override
  void initState() {
    //lifecycle //statefull widgetlar ekrana cizilmeden calisir build metodundan once calisir. init statete ekran guncellenmez cunku daha ekran cizilmemistir
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('a');
  } //gelen mesajı tek cift oldugnu ve conditionlari burada kontrol ettik

  void _computeName() {
    if (_isOdd) {
      _message += " Tek";
    } else {
      _message += " Cift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_message),
        ),
        body: _isOdd
            ? TextButton(onPressed: () {}, child: Text(_message))
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = "a";
                  });
                },
                child: Text(_message)));
  }
}
