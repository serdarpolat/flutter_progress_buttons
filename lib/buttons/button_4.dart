import 'dart:math';

import 'package:flutter/material.dart';

class Button4 extends StatefulWidget {
  @override
  _Button4State createState() => _Button4State();
}

class _Button4State extends State<Button4> with SingleTickerProviderStateMixin {
  AnimationController ctrl;
  Animation<double> anim;
  Animation<double> anim1;
  Animation<double> animPers;

  @override
  void initState() {
    super.initState();

    ctrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 4000))
          ..addListener(() {
            setState(() {
              if (ctrl.status == AnimationStatus.completed) {
                ctrl.reset();
              }
            });
          });

    anim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.1, 0.50, curve: Curves.easeInCubic),
    ));

    animPers = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.0, 0.1, curve: Curves.easeOut),
    ));

    anim1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.51, 0.65, curve: Curves.easeInOut),
    ));
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          if (ctrl.status == AnimationStatus.completed) {
            ctrl.reset();
          } else {
            ctrl.forward();
          }
        },
        child: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -100.0,
              child: Container(
                width: _width - 60.0,
                height: 100.0,
              ),
            ),
            Positioned(
              top: 0.0,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 0.0, 0.0)
                  ..setEntry(3, 2, 0.0006)
                  ..rotateX(-pi / 4 * (animPers.value)),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: _width - 60.0,
                  height: 20.0,
                  color: Color(0xFF0C9396),
                ),
              ),
            ),
            Transform(
              transform:
                  Matrix4.translationValues(0.0, 20.0 * animPers.value, 0.0)
                    ..setEntry(3, 2, 0.0006)
                    ..rotateX(pi / 4 * animPers.value),
              alignment: Alignment.topCenter,
              child: Container(
                width: _width - 60.0,
                height: 100.0,
                color: Color(0xFF00D5DA),
              ),
            ),
            Positioned(
              top: 0.0,
              child: Transform(
                transform: Matrix4.translationValues(
                    -(_width - 60.0) * (1.0 - anim.value), 0.0, 0.0)
                  ..setEntry(3, 2, 0.0006)
                  ..rotateX(-pi / 4 * (animPers.value)),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: _width - 60.0,
                  height: 20.0,
                  color: Color(0xFF175758),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, -100.0 * anim1.value, 0.0)
                ..setEntry(3, 2, 0.0006)
                ..rotateX(-pi / 4 * animPers.value),
              alignment: Alignment.bottomCenter,
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 100.0 * (1.1 - anim1.value), 0.0)
                ..setEntry(3, 2, 0.0006)
                ..rotateX(-pi / 4 * animPers.value),
              child: Icon(
                Icons.check,
                size: 40.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
