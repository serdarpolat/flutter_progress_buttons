import 'package:flutter/material.dart';
import 'package:progress_buttons/radial_progress.dart';

class Button0 extends StatefulWidget {
  @override
  Button0State createState() {
    return new Button0State();
  }
}

class Button0State extends State<Button0> with TickerProviderStateMixin {
  AnimationController ctrl;
  Animation<double> anim;
  Animation<double> anim1;
  Animation<double> anim2;
  Animation<double> scale;

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

    anim1 = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.0, 0.1, curve: Curves.linear),
    ));

    anim2 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.1, 0.15, curve: Curves.linear),
    ));

    anim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.1, 0.7, curve: Curves.easeInCubic),
    ));

    scale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: ctrl,
      curve: Interval(0.7, 0.72, curve: Curves.linear),
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
    var _height = MediaQuery.of(context).size.height;
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
            Opacity(
              opacity: anim1.value,
                          child: Container(
                width:
                    (_width - 60.0) * anim1.value + (100 * (1.0 - anim1.value)),
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xFF00D5DA),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                alignment: Alignment.center,
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
            ),
            Opacity(
              opacity: 1.0 * anim2.value,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: RadialProgressbar(
                  trackWidth: 6.0,
                  progressWidth: 6.0,
                  trackColor: Colors.grey,
                  progressPercent: 1.0 * anim.value,
                  progressColor: Color(0xFF2D2D2D),
                  innerPadding: EdgeInsets.all(2.0),
                  child: Transform.scale(
                    scale: 1.0 * scale.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF27AE60),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Icon(
                        Icons.check,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
