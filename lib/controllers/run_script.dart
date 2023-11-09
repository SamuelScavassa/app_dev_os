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

              var ret = await executeScript(
                  scriptPath, senhaController.text, context);

              resposta(ret, context);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

dynamic resposta(int ret, BuildContext context) {
  if (ret != 0) {
    return showDialog(
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
  }
  return showDialog(
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
}

Future<int> executeScript(
    String scriptPath, String senha, BuildContext context) async {
  try {
    String command = 'echo $senha | sudo -S $scriptPath';

    Process process = await Process.start(
      'bash',
      ['-c', command],
      mode: ProcessStartMode.inheritStdio,
    );

    int exitCode = await process.exitCode;

    return exitCode;
  } catch (e) {
    return 99;
  }
}
