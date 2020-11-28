import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sa_v1_migration/sa_v1_migration.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final tweenz = MultiTrackTween([
      // ignore: deprecated_member_use
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      // ignore: deprecated_member_use
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);
    // ignore: deprecated_member_use
    return ControlledAnimation(
    delay: Duration(milliseconds: (500 * delay).round()),
    duration: tweenz.duration,
    tween: tweenz,
    child: child,
    builderWithChild: (context, child, animation) => Opacity(
      opacity: animation["opacity"],
      child: Transform.translate(
          offset: Offset(0, animation["translateY"]), child: child),
    ),
  );
  }
}