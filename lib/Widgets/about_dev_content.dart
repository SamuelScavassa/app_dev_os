import 'package:flutter/material.dart';

class AppAndProjectInfoContent extends StatefulWidget {
  const AppAndProjectInfoContent({super.key});

  @override
  State<AppAndProjectInfoContent> createState() =>
      _AppAndProjectInfoContentState();
}

class _AppAndProjectInfoContentState extends State<AppAndProjectInfoContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "About DEV-OS",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sobre o Aplicativo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Nosso aplicativo é uma ferramenta poderosa que permite aos usuários encontrar e instalar rapidamente os aplicativos que desejam. Com uma interface intuitiva e fácil de usar, nosso objetivo é simplificar a experiência de descobrir e instalar novos aplicativos.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              "Sobre o Projeto",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Este projeto foi desenvolvido por uma equipe dedicada de desenvolvedores Flutter. Nossa missão era criar uma solução útil e eficaz para ajudar as pessoas a encontrar e instalar aplicativos facilmente. Trabalhamos arduamente para criar uma experiência de usuário de alta qualidade e estamos comprometidos em melhorar continuamente nosso aplicativo.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
