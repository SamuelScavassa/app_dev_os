import 'dart:io';
import 'dart:async';

Future<dynamic> executeScript(String scriptPath, String senha) async {
  String command = 'echo $senha | sudo -S $scriptPath';

  Process process = await Process.start(
    'bash',
    ['-c', command],
    mode: ProcessStartMode.inheritStdio,
  );

  if (await process.exitCode == 0) {
    return process.exitCode;
  } else {
    return Null;
  }
}
