import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/type_indicator/TypingIndicator.dart';
import 'package:flutter_ui/type_indicator/compose/FakeMessage.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ExampleIsTyping(),
    )
  );
}

const _backgroundColor = Color(0xFF333333);

class ExampleIsTyping extends StatefulWidget {
  const ExampleIsTyping({Key? key}) : super(key: key);

  @override
  State<ExampleIsTyping> createState() => _ExampleIsTypingState();
}

class _ExampleIsTypingState extends State<ExampleIsTyping> {
  bool _isSomeoneTyping = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: Text("Typing Indicator"),),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: FakeMessage(isBig: index.isOdd,),
                    );
                  }
              )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TypingIndicator(showIndicator: _isSomeoneTyping,),
          ),
          Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: CupertinoSwitch(
                onChanged: (newValue) {
                  setState(() {
                    _isSomeoneTyping = newValue;
                  });
                },
                value: _isSomeoneTyping,
              ),
            ),
          )
        ],
      ),
    );
  }
}
