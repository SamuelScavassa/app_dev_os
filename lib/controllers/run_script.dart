// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:async';

Future<bool> executeScript(String scriptPath, String senha) async {
  try {
    String command = 'echo $senha | sudo -S $scriptPath';

    Process process = await Process.start(
      'bash',
      ['-c', command],
      mode: ProcessStartMode.inheritStdio,
    );

    int exitCode = await process.exitCode;
    print(exitCode);
    return (true);
  } catch (e) {
    return false;
  }
}
