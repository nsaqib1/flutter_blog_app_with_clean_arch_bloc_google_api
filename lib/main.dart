import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const BlogApp());
}
