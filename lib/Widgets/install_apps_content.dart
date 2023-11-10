import 'package:flutter/material.dart';
import '../controllers/apps.dart';
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
            onPressed: () async {
              try {
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
                            Navigator.of(context)
                                .pop(); // Close the password dialog
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: CircularProgressIndicator(),
                                );
                              },
                            );
                            try {
                              var result = await executeScript(
                                  apps[index].path_script,
                                  senhaController.text);
                              Navigator.of(context).pop();
                              if (result == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Instalação concluída com sucesso!'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Erro $result'),
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              }
                            } catch (error) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Erro $error'),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              } catch (error) {
                // Handle any unexpected errors
                print("Error: $error");
              }
            },
            child: Text("Instalar"),
          ),
        );
      },
    );
  }
}
