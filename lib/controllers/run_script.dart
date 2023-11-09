// ignore_for_file: use_build_context_synchronously

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
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Instalação"),
                    content: Text("Instalando..."),
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

              var res = await executeScript(
                  scriptPath, senhaController.text, context);

              Navigator.of(context).pop();

              if (res == 0) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Instalação"),
                      content: Text("Instalado com sucesso"),
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
              } else {
                print('aaaaaaaa');
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
  print(exitCode);
  return (exitCode);
}
