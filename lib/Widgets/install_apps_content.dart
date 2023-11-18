import 'dart:io';
import 'package:flutter/material.dart';
import '../controllers/apps.dart';

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
    Future<dynamic> a(String scriptPath, String senha) async {
      String command = 'echo $senha | sudo -S $scriptPath';

      Process process = await Process.start(
        'bash',
        ['-c', command],
        mode: ProcessStartMode.inheritStdio,
      );

      var xx = await process.exitCode;
      process.kill();
      if (xx != 0) {
        return Exception();
      }
      return null;
    }

    void navSucesso() {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 150.0,
            content: Text('Sucesso ao instalar')),
      );
    }

    void navErro() {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 150.0,
            content: Text('Erro ao instalar')),
      );
    }

    void executeScript(String scriptPath, String senha) async {
      try {
        await a(scriptPath, senha);
        navSucesso();
      } catch (e) {
        navErro();
      }
    }

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
                                content: Text("Instalando...."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Voltar"),
                                  ),
                                ],
                              );
                            },
                          );
                          executeScript(
                              apps[index].path_script, senhaController.text);
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
