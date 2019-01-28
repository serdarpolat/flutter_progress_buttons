import 'package:flutter/material.dart';
import 'package:progress_buttons/buttons/button_0.dart';
import 'package:progress_buttons/buttons/button_0_1.dart';
import 'package:progress_buttons/buttons/button_1.dart';
import 'package:progress_buttons/buttons/button_2.dart';
import 'package:progress_buttons/buttons/button_3.dart';
import 'package:progress_buttons/buttons/button_4.dart';
import 'package:progress_buttons/buttons/button_5.dart';
import 'package:progress_buttons/buttons/button_6.dart';
import 'package:progress_buttons/buttons/button_7.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Button Styles'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: _width,
        height: _height,
        color: Color(0xFF212121),
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Button0(),
                Button01(),
                Button1(),
                Button2(),
                Button3(),
                Button4(),
                Button5(),
                Button6(),
                Button7(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
