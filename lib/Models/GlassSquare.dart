import 'dart:ui';

import 'package:flutter/material.dart';

class GlassSquare extends StatelessWidget {
  final double width, height;
  final Widget child;

  const GlassSquare(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: AnimatedContainer(
        width: width,
        height: height,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                width: width,
                height: height,
                child: const Text(" "),
              ),
            ),
            const Opacity(
              opacity: 0.15,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 30,
                        offset: const Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1),
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  )),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
