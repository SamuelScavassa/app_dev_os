import 'package:flutter/material.dart';

class AboutUsContent extends StatefulWidget {
  const AboutUsContent({super.key});

  @override
  State<AboutUsContent> createState() => _AboutUsContentState();
}

class _AboutUsContentState extends State<AboutUsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Sobre mim",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              const Text(
                " Meu nome é Samuel, tenho 20 anos e sou apaixonado pela área de Tecnologia. Possuo experiência em uma variedade de tecnologias, "
                "incluindo o Pacote Office, distribuições Linux, bem como nas linguagens Python, C, HTML/CSS e C# (.NET), SQL (SQL Server), TypeScript"
                "(Angular), Dart (Flutter) e Ruby (Rails), além de conhecimentos em cibersegurança e redes de computadores. Anteriormente, "
                "atuei como estagiário na Secretaria Municipal da Cultura de São José do Rio Preto. Atualmente, sou estagiário na área de Engenharia de "
                "Dados (SQL, Python, Airflow, dbt e PBI) dentro da divisão de Business Intelligence na Tereos, enquanto curso o sexto semestre do "
                "curso de Análise e Desenvolvimento de Sistemas na Fatec Rio Preto. \n"
                " Este é meu Trabalho de conclusão de curso para "
                "minha graduação em análise e desenvolvimento de sistemas. Adoro Tecnologia de todas as formas, amo programar "
                "e fazer exeperiências na área. \n"
                " Nesse contexto, adoro softwares de código aberto e toda sua filosofia de compartilhar o conhecimento. Com isso em mente,"
                " escolhi desenvolver esse projeto.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'images/img.jpg',
                  width: 200,
                  height: 200,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
