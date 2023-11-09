import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';

var varr = 'Instalando ...';
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
              await executeScript(scriptPath, senhaController.text, context);
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
  String command = 'echo $senha | sudo -S $scriptPath';

  Process process = await Process.start(
    'bash',
    ['-c', command],
    mode: ProcessStartMode.inheritStdio,
  );

  int exitCode = await process.exitCode;

  if (exitCode == 0) {
    
    varr = 'Instalado com sucesso';
  } else {
    varr = 'Erro ao instalar';
  }
}
