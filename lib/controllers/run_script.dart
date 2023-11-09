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
              try {
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
                await executeScript(scriptPath, senhaController.text, context);
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Erro"),
                      content: Text("Erro $e"),
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
                Navigator.of(context).pop();
              }
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

Future<void> executeScript(
    String scriptPath, String senha, BuildContext context) async {
  try {
    String command = 'echo $senha | sudo -S $scriptPath';

    Process process = await Process.start(
      'bash',
      ['-c', command],
      mode: ProcessStartMode.inheritStdio,
    );

    int exitCode = await process.exitCode;

    print('Script executado com código de saída: $exitCode');
  } catch (e) {
    print('Erro ao executar o script: $e');
  }
}
