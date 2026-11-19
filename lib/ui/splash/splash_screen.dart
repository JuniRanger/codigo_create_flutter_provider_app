import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noteapp/app_localizations.dart';
import 'package:noteapp/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
            child: Text(
          AppLocalizations.of(context).translate("splashTitle"),
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
          ),
        )),
        FlutterLogo(
          size: 128,
        ),
      ],
    )));
  }

  startTimer() {
    var duration = Duration(milliseconds: 3000);
    _timer = Timer(duration, redirect);
  }

  redirect() async {
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }
}
