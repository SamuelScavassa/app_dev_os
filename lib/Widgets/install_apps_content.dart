import 'package:flutter/material.dart';

class App {
  final String name;
  final String description;
  final IconData icon;

  App(this.name, this.description, this.icon);
}

class InstallAppsContent extends StatefulWidget {
  const InstallAppsContent({super.key});

  @override
  State<InstallAppsContent> createState() => _InstallAppsContentState();
}

class _InstallAppsContentState extends State<InstallAppsContent> {
  final List<App> apps = [
    App("Flutter", "", Icons.apps),
    App("Ruby", "", Icons.apps),
    App("Dotnet", "", Icons.apps),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            apps[index].icon,
            color: Colors.white,
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
