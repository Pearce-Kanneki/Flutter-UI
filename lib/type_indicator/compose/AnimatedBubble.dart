import 'package:flutter/cupertino.dart';

class AnimatedBubble extends StatelessWidget {
  const AnimatedBubble({
    Key? key,
    required this.animation,
    required this.left,
    required this.bottom,
    required this.bubble
  }) : super(key: key);

  final Animation<double> animation;
  final double left;
  final double bottom;
  final Widget bubble;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: animation.value,
            alignment: Alignment.bottomLeft,
            child: child,
          );
        },
        child: bubble,
      ),
    );
  }
}
