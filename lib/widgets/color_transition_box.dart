import 'package:flutter/material.dart';

class ColorTransitionBox extends AnimatedWidget {
  final Widget child;
  final Animation<Color?> animation;

  ColorTransitionBox({
    required this.child,
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: animation.value,
      ),
      child: child,
    );
  }
}
