import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final MaterialColor color;
  final Widget child;

  const Background({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
            0,
            1.0
          ],
              colors: [
            color[800]!,
            color[400]!,
          ])),
      child: child,
    );
  }
}
