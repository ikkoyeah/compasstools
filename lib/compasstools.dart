import 'dart:async';

import 'package:flutter/services.dart';

class Compasstools{


  static Stream<int> _azimuthValue;

  static const MethodChannel _channel =
  const MethodChannel('checkDeviceSensors');

  static const EventChannel _eventChannel =
  const EventChannel('azimuthStream');

  static Future<int> get checkSensors async {
    final int haveSensor = await _channel.invokeMethod('getSensors');
    return haveSensor;
  }

  static Stream<int> get azimuthStream{
    if (_azimuthValue == null)
    {
      _azimuthValue = _eventChannel.receiveBroadcastStream().map<int>((value)=>value);
    }

    return _azimuthValue;
  }

}