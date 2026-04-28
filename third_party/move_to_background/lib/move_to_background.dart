import 'package:flutter/services.dart';

class MoveToBackground {
  static const MethodChannel _channel = MethodChannel('move_to_background');

  static Future<bool> moveTaskToBack() async {
    final bool? moved = await _channel.invokeMethod<bool>('moveTaskToBack');
    return moved ?? false;
  }
}
