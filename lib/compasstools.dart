import 'dart:async';

import 'package:flutter/services.dart';

class Compasstools{
  static const MethodChannel _channel =
  const MethodChannel('compasstools');

  static Future<int> get checkSensors async {
    final int haveSensor = await _channel.invokeMethod('checkSensors');
    return haveSensor;
  }
}