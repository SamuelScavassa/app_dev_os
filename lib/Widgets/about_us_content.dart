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
      body: Padding(
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
              " Olá, me chamo Samuel Melegatti Scavassa tenho 20 anos e este é meu Trabalho de conclusão de curso para "
              "minha graduação em análise e desenvolvimento de sistemas. Adoro Tecnologia de todas as formas, amo programar "
              "e fazer exeperiências na área. \n"
              " Nesse contexto, adoro softwares de código aberto e toda sua filosofia de compartilhar o conhecimento. Com isso em mente,"
              " escolhi desenvolver este projeto.",
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
    );
  }
}
