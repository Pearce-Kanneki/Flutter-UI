import 'package:flutter/material.dart';
import 'package:flutter_ui/fab/ActionButton.dart';
import 'package:flutter_ui/fab/ExpandableFab.dart';
import 'package:flutter_ui/fab/FakeItem.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainExpandableFab(),
      //debugShowCheckedModeBanner: false,
    )
  );
}

class MainExpandableFab extends StatelessWidget {
  const MainExpandableFab({Key? key}) : super(key: key);

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
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
              icon: Icon(Icons.format_size),
            onPressed: () => _showAction(context, 0),
          ),
          ActionButton(
            icon: Icon(Icons.insert_photo),
            onPressed: () => _showAction(context, 1),
          ),
          ActionButton(
            icon: Icon(Icons.videocam),
            onPressed: () => _showAction(context, 2),
          )
        ],
      ),
    );
  }
}
