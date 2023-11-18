import '../Widgets/install_apps_content.dart';

final List<App> apps = [
  App("Flutter", "Instale o Framework Flutter via snap",
      'images/logos/flutter.png', 'snap install -y snap'),
  App(
      "Ruby",
      "Instale a linguegem Ruby, juntamente com o Framework Ruby on Rails e tudo que é necessário para sua utilização",
      'images/logos/ruby.png',
      'sudo apt update && sudo apt install ruby-full && sudo apt install nodejs && sudo apt install yarn && sudo apt install sqlite3 && sudo apt install sqlite3 && gem install rails'),
  App("C++", "Instale o compilador C++ CMake", 'images/logos/c++.png',
      'apt install -y cmake'),
  App("PHP", "Instale a linguagem PHP", 'images/logos/php.png', 'apt install -y php'),
  App("Kotlin", "Instale a linguagem Kotlin", 'images/logos/kotlin.png',
      'snap install kotlin --classic'),
  App("Rust", "Instale a linguagem Rust", 'images/logos/rust.png', 'scripts/flutter.sh'),
  App("Android Studio", "Instale a IDE Android Studio", 'images/logos/as.png',
      'snap install andorid-studio --classic'),
  App("Pycharm Community", "Instale a IDE Pycharm Community",
      'images/logos/pycharm.png', 'snap install pycharm-community --classic'),
  App("Postman", "Instale Postman, uma opção amigavel para testar API's",
      'images/logos/postman.png', 'snap install postman --classic'),
  App(
      "DBeaver",
      "Instale DBeaver, uma IDE para gerenciamento de bancos de dados",
      'images/logos/dbeaver.png',
      ''),
  App(
      "SQL Lite Browser",
      "Instale SQL Lite Browser, a mehor opção para gerenciar arquivos SQL Lite.",
      'images/logos/sqllite.png',
      'sudo apt install sqlitebrowser -y'),
];
