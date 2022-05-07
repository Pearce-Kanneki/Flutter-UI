import 'package:flutter/cupertino.dart';

class CircleBubble extends StatelessWidget {
  const CircleBubble({
    Key? key,
    required this.size,
    required this.bubbleColor
  }) : super(key: key);

  final double size;
  final Color bubbleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bubbleColor
      ),
    );
  }
}
