import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bug_logger/console_overlay.dart';
import 'package:flutter_bug_logger/flutter_logger.dart';

class AppLogger {
  AppLogger.init(bool isProd) {
    AppLogger.isProd = isProd;
    if (!isProd) {
      Logger.init(
        !isProd,
        isShowFile: false,
        isShowTime: true,
        isShowNavigation: false,
        levelVerbose: 247,
        levelDebug: 26,
        levelInfo: 28,
        levelWarn: 3,
        levelError: 9,
        phoneVerbose: Colors.white54,
        phoneDebug: Colors.blue,
        phoneInfo: Colors.green,
        phoneWarn: Colors.yellow,
        phoneError: Colors.redAccent,
      );
    }
  }
  static bool isProd = false;
  static String jsonToString(Map<String?, dynamic> json) {
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  static void logApi(String apiType, String path, Map<String?, dynamic> body, Map<String?, dynamic> response) {
    return Logger.d('$apiType Path :$path \n Body:${AppLogger.jsonToString(body)} \n Response: ${AppLogger.jsonToString(response)} ');
  }

  static void showDebugger(BuildContext context) {
    if (!isProd) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        ConsoleOverlay.show(context);
      });
    }
  }

  void verbose(dynamic message) {
    Logger.v(message);
  }

  void debug(dynamic message) {
    Logger.d(message);
  }

  void info(dynamic message) {
    Logger.i(message);
  }

  void warning(dynamic message) {
    Logger.w(message);
  }

  void error(dynamic message, StackTrace trace) {
    Logger.e('$message \n Trace: $trace');
  }
}
