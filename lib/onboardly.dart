
import 'dart:async';

import 'package:flutter/services.dart';

class Onboardly {
  static const MethodChannel _channel =
      const MethodChannel('onboardly');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
