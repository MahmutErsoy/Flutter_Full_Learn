import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showAboutDialog(context: context, applicationName: 'Mahmut');

          final response = await showDialog(
            context: context,
            barrierDismissible:
                false, // bunu verirsek açılan alerte basmaz ise ekrandan gitmez. true verirsek ekranın istediğin yerine basınca kapanır
            builder: (context) {
              return const _ImageZoomDialog();
            },
          );
          inspect(response);
        },
      ),
      appBar: AppBar(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Keys.versionUpdate),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'))
      ],
    );
    // Dialog(child: Text('data')); // return den spnra bu da kullanılabilir. ama biz yukarıda alert dialog kullandık.
  }
}

class Keys {
  static const versionUpdate = 'Version Update';
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        // bu widget resmi alt fn ile zoom yapmamızı sağlıyor.
        child: Image.network(
          'https://picsum.photos/200',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    );
  }
}
