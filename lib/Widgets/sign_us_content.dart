import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDevelopersContent extends StatefulWidget {
  const ContactDevelopersContent({super.key});

  @override
  State<ContactDevelopersContent> createState() =>
      _ContactDevelopersContentState();
}

class _ContactDevelopersContentState extends State<ContactDevelopersContent> {
  // Função para abrir URLs
  void _launchURL(String url) async {
    var x = Uri.parse(url);
    if (await canLaunchUrl(x)) {
      await launchUrl(x);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Me siga 🏃‍♂️",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contate o Desenvolvedor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Se você tiver alguma dúvida, feedback ou precisar de suporte, não hesite em entrar em contato comigo 🙂",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              "Meios de Comunicação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                _launchURL("https://github.com/SamuelScavassa");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.code,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "GitHub: Samuel M Scavassa",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL("https://www.instagram.com/samuelmelegatti/");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Instagram: Samuel M Scavassa",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL("mailto:samuel040103@gmail.com");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Email: Samuel M Scavassa",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
