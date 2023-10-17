import 'package:flutter/material.dart';

class App {
  final String name;
  final String description;
  final String img;

  App(this.name, this.description, this.img);
}

class InstallAppsContent extends StatefulWidget {
  const InstallAppsContent({super.key});

  @override
  State<InstallAppsContent> createState() => _InstallAppsContentState();
}

class _InstallAppsContentState extends State<InstallAppsContent> {
  final List<App> apps = [
    App("Flutter", "Instale o Framework Flutter via snap",
        'images/logos/flutter.png'),
    App(
        "Ruby",
        "Instale a linguegem Ruby, juntamente com o Framework Ruby on Rails",
        'images/logos/ruby.png'),
    App("C++", "Instale o compilador C++ CMake", 'images/logos/c++.png'),
    App("PHP", "Instale ....", 'images/logos/php.png'),
    App("Swift", "Instale ....", 'images/logos/swift.png'),
    App("Kotlin", "Instale ....", 'images/logos/kotlin.png'),
    App("Rust", "Instale ....", 'images/logos/rust.png'),
    App("Go", "Instale ....", 'images/logos/go.png'),
    App("Android Studio", "Instale ....", 'images/logos/as.png'),
    App("Pycharm Community", "Instale ....", 'images/logos/pycharm.png'),
    App("Postman", "Instale ....", 'images/logos/postman.png'),
    App("DBeaver", "Instale ....", 'images/logos/dbeaver.png'),
    App("SQL Lite Browser", "Instale ....", 'images/logos/sqllite.png'),
    App("Docker", "Instale ....", 'images/logos/docker.png'),
  ];

  @override
  Widget build(BuildContext context) {
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
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Instalação"),
                    content: Text("Instalando ${apps[index].name}..."),
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
            },
            child: Text("Instalar"),
          ),
        );
      },
    );
  }
}
