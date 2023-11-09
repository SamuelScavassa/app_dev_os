import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';

Future<void> runScriptWithSudo(String scriptPath, BuildContext context) async {
  TextEditingController senhaController = TextEditingController();

  await showDialog(
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
              var varr;
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

              try {
                await executeScript(scriptPath, senhaController.text, context);
              } catch (e) {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Erro"),
                      content: Text("Erro"),
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
              } finally {
                varr = 'Instalado com sucesso';
              }
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

Future<int> executeScript(
    String scriptPath, String senha, BuildContext context) async {
  String command = 'echo $senha | sudo -S $scriptPath';

  Process process = await Process.start(
    'bash',
    ['-c', command],
    mode: ProcessStartMode.inheritStdio,
  );

  int exitCode = await process.exitCode;

  return exitCode;
}
