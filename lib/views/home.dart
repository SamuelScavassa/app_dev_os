import 'package:app_init/Widgets/install_apps_content.dart';
import 'package:app_init/Widgets/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Welcome to DEV-OS')),
        ),
        body: menuLateral());
  }
}
