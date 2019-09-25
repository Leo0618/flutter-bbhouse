import 'dart:io';

import 'package:flutter/services.dart';

/// function: fmap
/// <p>Created by Leo on 2019/9/25.</p>

class Fmap {
  Fmap._();

  static const MethodChannel _channel = const MethodChannel("fmap");

  static void showOldHouseMapShow(double lon, double lat) {
    if (Platform.isAndroid) {
      _channel.invokeMethod('showOldHouseMapShow', {'lon': lon, 'lat': lat});
    } else {
      print('notImplemented. method:showOldHouseMapShow');
    }
  }
}
