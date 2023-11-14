

import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

Future<dynamic> a(String scriptPath, String senha) async {
  String command = 'echo $senha | sudo -S $scriptPath && exit';
  
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

void executeScript(BuildContext context, String scriptPath, String senha) async {
  
  try {
    await a(scriptPath, senha);
    navSucesso(context);
     }
  catch(e) {
    navErro(context);
  } 
    
}

void navSucesso(BuildContext context) {
  Navigator.of(context).popAndPushNamed("/sucesso");
}
void navErro(BuildContext context) {
  Navigator.of(context).popAndPushNamed("/erro");
}

