import 'package:flutter/material.dart';
import 'dart:async';
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
    checkDeviceSensors();

  }

  Future<void> checkDeviceSensors() async {

    int haveSensor;

    try{
      haveSensor = await Compasstools.checkSensors;

    } on Exception {

    }

    if (!mounted) return;

    setState(() {
      _haveSensor = haveSensor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(_haveSensor.toString()),
        ),
      ),
    );
  }

}
