import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  @override
  Button1State createState() {
    return new Button1State();
  }
}

class Button1State extends State<Button1> with TickerProviderStateMixin {
  AnimationController ctrl;
  Animation<double> anim;
  Animation<double> anim1;
  Animation animColor;

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
      curve: Interval(0.0, 0.50, curve: Curves.easeInCubic),
    ));

    anim1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.51, 0.65, curve: Curves.easeInOut),
    ));

    animColor = ColorTween(begin: Color(0xFF175758), end: Color(0xFF27AE60)).animate(CurvedAnimation(
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
            Container(
              width: _width - 60.0,
              height: 100.0,
              color: Color(0xFF00D5DA),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  -(_width - 60.0) * (1.0 - anim.value), 0.0, 0.0),
              child: Container(
                width: _width - 60.0,
                height: 100.0,
                color: animColor.value,
              ),
            ),
            Transform(
              transform:
                  Matrix4.translationValues(0.0, -100.0 * anim1.value, 0.0),
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
                  0.0, 100.0 * (1.0 - anim1.value), 0.0),
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
