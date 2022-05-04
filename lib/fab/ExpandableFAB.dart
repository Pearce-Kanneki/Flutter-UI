import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/fab/FakeItem.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ExpandableFab(),
      //debugShowCheckedModeBanner: false,
    )
  );
}

class ExpandableFab extends StatelessWidget {
  const ExpandableFab({Key? key}) : super(key: key);

  static const _actionTitles = [
    'Create Post',
    'Upload Photo',
    'Upload Video'
  ];

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(_actionTitles[index]),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('CLOSE')
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expandable Fab"),),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: 25,
        itemBuilder: (context, index) {
          return FakeItem(isBig: index.isOdd);
        },
      ),
    );
  }
}
