import 'package:flutter/material.dart';

class FakeMessage extends StatelessWidget {
  const FakeMessage({
    Key? key,
    required this.isBig
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      height: isBig ? 128.0 : 36.0,
      color: Colors.grey.shade300,
    );
  }
}
