

import 'package:flutter/material.dart';

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for(int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
          i,
          transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0)
      );
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;
  }
}
