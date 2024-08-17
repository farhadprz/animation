import 'dart:math';

import 'package:flutter/material.dart';

double randomBorderRadius() => Random().nextDouble() * 64;

double randomMargin() => Random().nextDouble() * 64;

Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  static const String routeName = 'basics/animated_container';

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    // This widget is built using an AnimatedContainer, one of the easiest to use
    // animated Widgets. Whenever the AnimatedContainer's properties, such as decoration,
    // change, it will handle animating from the previous value to the new value. You can
    // specify both a Duration and a Curve for the animation.
    // This Widget is useful for designing animated interfaces that just need to change
    // the properties of a container. For example, you could use this to design expanding
    // and shrinking cards.
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                color = randomColor();
                borderRadius = randomBorderRadius();
                margin = randomMargin();
              }),
              child: const Text('change'),
            ),
          ],
        ),
      ),
    );
  }
}
