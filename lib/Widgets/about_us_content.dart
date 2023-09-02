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
          "Sobre Nós",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sobre Nós",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Somos uma equipe dedicada de desenvolvedores Flutter que adora criar aplicativos incríveis para nossos usuários. Nossa missão é fornecer soluções inovadoras e de alta qualidade que melhorem a vida das pessoas.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Entre em Contato",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Email: contato@exemplo.com",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Telefone: (123) 456-7890",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
