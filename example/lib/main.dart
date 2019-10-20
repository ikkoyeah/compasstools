import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:compasstools/compasstools.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _haveSensor;

  @override
  void initState() {
    super.initState();
    checkSensors();
  }

  Future<void> checkSensors() async {
    try{
      _haveSensor = await Compasstools.checkSensors;
    } on Exception {
      _haveSensor = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text("$_haveSensor"),
        ),
      ),
    );
  }
}
