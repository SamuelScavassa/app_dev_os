import 'package:app_init/views/home.dart';
import 'package:flutter/material.dart';

import 'Themes/appTheme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: tema(),
      routes: {
        '/home': (context) => Home(),
      },
      initialRoute: '/home',
    );
  }
}
