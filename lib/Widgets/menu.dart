import 'package:dev_os/Widgets/about_dev_content.dart';
import 'package:dev_os/Widgets/about_us_content.dart';
import 'package:dev_os/Widgets/install_apps_content.dart';
import 'package:dev_os/Widgets/sign_us_content.dart';
import 'package:flutter/material.dart';

import 'home_content.dart';

class menuLateral extends StatefulWidget {
  const menuLateral({super.key});

  @override
  State<menuLateral> createState() => _menuLateralState();
}

class _menuLateralState extends State<menuLateral> {
  Widget conteudo = HomeContent();
  void install() {
    setState(() {
      conteudo = InstallAppsContent();
    });
  }

  void about() {
    setState(() {
      conteudo = AboutUsContent();
    });
  }

  void dev() {
    setState(() {
      conteudo = AppAndProjectInfoContent();
    });
  }

  void sign() {
    setState(() {
      conteudo = ContactDevelopersContent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/icon.png'),
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          conteudo = HomeContent();
                        }),
                      },
                      child: Text("Home"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: install, child: Text('Instalar Tools')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: dev, child: Text('Sobre DEV OS')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: about, child: Text('    Sobre mim    ')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: sign, child: Text('     Me siga     ')),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(flex: 5, child: conteudo),
        ],
      ),
    );
  }
}
