import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<String> imageUrls = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Dev OS o seu sistema para desenvolvimento de software",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                " Este sistema, pretende oferecer uma solução para que desenvolvedores adotem o sistema operacional Linux como ambiente e desenvolvimento principal. Trazendo diversos recursos pertinentes para o contexto, este sistema pretende facilitar a migração de outros sistemas. Este também se propõe a ser uma ferramenta útil para os desenvolvedores pois irá contar com diversos recursos de desenvolvimento. Dessa forma, se espera utilizar conhecimentos em sistemas operacionais, programação de aplicações e software livre para sua construção. Em resumo, este sistema pretende desenvolver uma ferramenta para desenvolvedores, utilizar os conhecimentos absorvidos na trajetória do curso e por fim, contribuir com a comunidade Open Source.  ",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 10,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 7),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
