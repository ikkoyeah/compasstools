import 'package:flutter/material.dart';
import 'dart:async';
import 'package:compasstools/compasstools.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    super.initState();
    checkDeviceSensors();

  }

  Future<void> checkDeviceSensors() async {

    int haveSensor;

    try{
      haveSensor = await Compasstools.checkSensors;

      switch(haveSensor) {
        case 0: {
          // statements;
          sensorType="No sensors for Compass";
        }
        break;

        case 1: {
          //statements;
          sensorType="Accelerometer + Magnetoneter";
        }
        break;

        case 2: {
          //statements;
          sensorType="Gyroscope";
        }
        break;

        default: {
          //statements;
          sensorType="Error!";
        }
        break;
      }

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
        body: new Container(
        child: Column(
        children:<Widget>[StreamBuilder(
          stream: Compasstools.azimuthStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if(snapshot.hasData) {
              return
                Padding(
                  padding: EdgeInsets.all(20),
                  child:Center(
                    child:new RotationTransition(turns: new AlwaysStoppedAnimation(-snapshot.data/360),
                      child: Image.asset("assets/compass.png"),
                    ),
                  ),
                );
            } else
              return Text("Error in stream");
          },
          ),
          Text("SensorType: "+sensorType),
          ],),
      ),
    ),
    );
  }

}
