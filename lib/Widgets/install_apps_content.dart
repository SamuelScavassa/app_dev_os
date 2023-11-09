import 'package:flutter/material.dart';

import '../controllers/run_script.dart';

class App {
  final String name;
  final String description;
  final String img;
  final String path_script;

  App(this.name, this.description, this.img, this.path_script);
}

class InstallAppsContent extends StatefulWidget {
  const InstallAppsContent({super.key});

  @override
  State<InstallAppsContent> createState() => _InstallAppsContentState();
}

class _InstallAppsContentState extends State<InstallAppsContent> {
  final List<App> apps = [
    App("Flutter", "Instale o Framework Flutter via snap",
        'images/logos/flutter.png', 'snap install -y snap'),
    App(
        "Ruby",
        "Instale a linguegem Ruby, juntamente com o Framework Ruby on Rails",
        'images/logos/ruby.png',
        'apt install -y ruby'),
    App("C++", "Instale o compilador C++ CMake", 'images/logos/c++.png',
        'apt install -y cmake'),
    App("PHP", "Instale ....", 'images/logos/php.png', 'apt install -y php'),
    App("Swift", "Instale ....", 'images/logos/swift.png',
        'scripts/flutter.sh'),
    App("Kotlin", "Instale ....", 'images/logos/kotlin.png',
        'scripts/flutter.sh'),
    App("Rust", "Instale ....", 'images/logos/rust.png', 'scripts/flutter.sh'),
    App("Go", "Instale ....", 'images/logos/go.png', 'scripts/flutter.sh'),
    App("Android Studio", "Instale ....", 'images/logos/as.png',
        'scripts/flutter.sh'),
    App("Pycharm Community", "Instale ....", 'images/logos/pycharm.png',
        'scripts/flutter.sh'),
    App("Postman", "Instale ....", 'images/logos/postman.png',
        'scripts/flutter.sh'),
    App("DBeaver", "Instale ....", 'images/logos/dbeaver.png',
        'scripts/flutter.sh'),
    App("SQL Lite Browser", "Instale ....", 'images/logos/sqllite.png',
        'scripts/flutter.sh'),
    App("Docker", "Instale ....", 'images/logos/docker.png',
        'scripts/flutter.sh'),
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController senhaController = TextEditingController();
    return ListView.builder(
      itemCount: apps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            apps[index].img,
            height: 40,
            width: 40, // Carregue a imagem usando Image.asset
          ),
          title: Text(
            apps[index].name,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(apps[index].description),
          trailing: ElevatedButton(
            onPressed: () {
              // Adicione aqui a lógica para iniciar a instalação do aplicativo
              var varr = 'Instalando...';
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Digite a Senha"),
                    content: TextField(
                      controller: senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Instalação"),
                                content: Text("$varr"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Fechar"),
                                  ),
                                ],
                              );
                            },
                          );

                          var x = await executeScript(
                              apps[index].path_script, senhaController.text);
                          if (x == 0) {
                            setState(() {
                              varr = 'Sucesso';
                            });
                          } else {
                            setState(() {
                              varr = 'Erro';
                            });
                          }
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Instalar"),
          ),
        );
      },
    );
  }
}
