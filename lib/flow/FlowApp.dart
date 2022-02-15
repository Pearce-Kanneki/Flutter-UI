import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/flow/FlowMenu.dart';

void main() {
  runApp(FlowApp());
}

class FlowApp extends StatefulWidget {
  const FlowApp({Key? key}) : super(key: key);

  @override
  _FlowAppState createState() => _FlowAppState();
}

class _FlowAppState extends State<FlowApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Flow Example")),
        body: const FlowMenu(),
      ),
    );
  }
}

