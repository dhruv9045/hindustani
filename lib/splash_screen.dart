import 'dart:async';
import 'package:Hindustani/loaders/color_loader_3.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'constants.dart';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black87.withOpacity(0.8), BlendMode.difference),
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/logo0.png',
                                height: 150,width: 150,),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(
                                        thickness: 2.0,
                                        color: Colors.black,
                                        height: 50,
                                      )),
                                ),
                                Text(
                                  "HINDUSTANI",
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                                      child: Divider(
                                        thickness: 2.0,
                                        color: Colors.black,
                                        height: 50,
                                      )),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ColorLoader3(),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                    ),
                    Container(
                      child: GradientText(
                        'MADE IN INDIA',
                        textAlign: TextAlign.center,
                        gradient: LinearGradient(colors: [
                          Colors.deepOrange,
                          Colors.red,
                          Colors.white70,
                          Colors.white,
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
