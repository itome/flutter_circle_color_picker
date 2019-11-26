import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCircleColorPicker {
  static const MethodChannel _channel =
      const MethodChannel('flutter_circle_color_picker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
