/*
 * Author: Yi Sanghoon
 * Email: uphoon@gmail.com
 * Created Date: 2024-01-25
 * Last Modified: 2024-01-28
 * Description:
 *  This file is used for creating the Equalizer animation
 * using CustomPainter and AnimationController 
 */

import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Equalizer.event(
          onPress: () {
            print("onPress");
          },
          isPlaying: false,
        ),
      ),
    ),
  ));
}

class Equalizer extends StatefulWidget {
  Function? onPress;
  bool isPlaying = false;

  Equalizer({super.key});

  Equalizer.event({required this.onPress, this.isPlaying = false, Key? key})
      : super(key: key);

  @override
  EqualizerState createState() => EqualizerState(onPress, isPlaying);
}

class EqualizerState extends State<Equalizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Function? onPress;
  bool isPlaying;

  EqualizerState(this.onPress, this.isPlaying);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isPlaying) {
      _controller.repeat(reverse: true);
    } else {
      _controller.stop();
    }

    return GestureDetector(
      onTap: _toggleAnimation,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return CustomPaint(
            size: const Size(100, 120),
            painter: EqualizerPainter(_controller.value),
          );
        },
      ),
    );
  }

  void _toggleAnimation() {
    if (onPress != null) onPress!();

    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    });
  }
}

class EqualizerPainter extends CustomPainter {
  EqualizerPainter(this.value) : super();

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    // Define the number of bars you want
    const barCount = 7;

    // Define the width of each bar
    final barWidth = size.width / (2 * barCount + 1);

    List<int> startYBars = [0, 20, -60, 40, -10, 30, 5];

    for (int i = 0; i < barCount; i++) {
      // var heightGap = startYBars[math.Random().nextInt(startYBars.length)];
      var heightGap = startYBars[i];

      // Randomize the bar height based on the animation value
      final barHeight = i.isEven
          ? size.height / 2 * (math.Random().nextDouble() + 0.1) * value
          : size.height / 2 * (math.Random().nextDouble() + 0.2) * value;

      final barX = barWidth + i * barWidth * 2;

      final startY = size.height / 2 + (barHeight + heightGap) / 2;
      final endY = size.height / 2 - (barHeight + heightGap) / 2;

      canvas.drawLine(Offset(barX, startY), Offset(barX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
