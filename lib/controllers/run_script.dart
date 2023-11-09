// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:async';


Future<int> executeScript(
    String scriptPath, String senha) async {
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
