import 'dart:io';
import 'dart:async';

Future<void> runScriptWithSudo(String scriptPath) async {
  try {

    String command = 'sudo $scriptPath';

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
