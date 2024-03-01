import 'dart:async';

import 'package:flutter/material.dart';

class DeBouncerHelper {
  DeBouncerHelper({this.milliseconds = 1000});

  int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
