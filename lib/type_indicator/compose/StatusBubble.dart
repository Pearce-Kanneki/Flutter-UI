import 'dart:math';

import 'package:flutter/cupertino.dart';

class StatusBubble extends StatelessWidget {
  const StatusBubble({
    Key? key,
    required this.repeatingController,
    required this.dotIntervals,
    required this.flashingCircleDarkColor,
    required this.flashingCircleBrightColor,
    required this.bubbleColor
  }) : super(key: key);

  final AnimationController repeatingController;
  final List<Interval> dotIntervals;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;
  final Color bubbleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: bubbleColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlashingCircle(
              index: 0,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
              flashingCircleDarkColor: flashingCircleDarkColor,
              flashingCircleBrightColor: flashingCircleBrightColor
          ),
          FlashingCircle(
              index: 1,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
              flashingCircleDarkColor: flashingCircleDarkColor,
              flashingCircleBrightColor: flashingCircleBrightColor
          ),
          FlashingCircle(
              index: 2,
              repeatingController: repeatingController,
              dotIntervals: dotIntervals,
              flashingCircleDarkColor: flashingCircleDarkColor,
              flashingCircleBrightColor: flashingCircleBrightColor
          ),
        ],
      ),
    );
  }
}

class FlashingCircle extends StatelessWidget {
  const FlashingCircle({
    Key? key,
    required this.index,
    required this.repeatingController,
    required this.dotIntervals,
    required this.flashingCircleDarkColor,
    required this.flashingCircleBrightColor
  }) : super(key: key);

  final int index;
  final AnimationController repeatingController;
  final List<Interval> dotIntervals;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: repeatingController,
        builder: (context, child) {
          final circleFlashPercent = dotIntervals[index].transform(
            repeatingController.value
          );
          final circleColorPercent = sin(pi * circleFlashPercent);

          return Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.lerp(
                  flashingCircleDarkColor,
                  flashingCircleBrightColor,
                  circleColorPercent
              )
            ),
          );
        }
    );
  }
}

