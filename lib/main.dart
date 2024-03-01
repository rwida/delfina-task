import 'package:flutter/material.dart';
import 'package:new_app/app.dart';

import './core/dependencies/dependency_init.dart';
import './core/common/env_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvVariables.instance().init();
  configureDependencies();
  runApp(const MyApp());
}
