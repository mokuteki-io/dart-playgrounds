import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/user_observable.dart';
import 'package:playground_app/mvos/service/firebase_service.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  String _fadingString;
  List<String> _strings = [
    "Mokuteki.io",
    "Dart Playgrounds",
    null,
  ];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), _signInAnonymously);
    _fadingString = _strings.first;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse().whenComplete(changeString);
      } else if (_fadingString == null) {
        _controller.stop();
        newRouting();
      }
    });
    super.initState();
  }

  Future<void> _signInAnonymously() async {
    FirebaseService firebaseService = Provider.of(context, listen: false);
    firebaseService.loginAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<LoggedInO>(
          builder: (context, o, child) => Text(o.loggedIn ? 'Yes' : 'No'),
        ),
        FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text(
              "$_fadingString",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ],
    ));
  }

  void newRouting() {
    Navigator.pushReplacementNamed(context, RouteName.homePage);
  }

  void changeString() {
    setState(() {
      _strings.removeAt(0);
      _fadingString = _strings.first;
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}