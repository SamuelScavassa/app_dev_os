import 'package:flutter/material.dart';

Widget menuLateral() {
  return Container(
    padding: EdgeInsets.all(10),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              ElevatedButton(onPressed: null, child: Text(' Install  Apps  ')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: null, child: Text('About DEV OS')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              ElevatedButton(onPressed: null, child: Text('    About Us    ')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              ElevatedButton(onPressed: null, child: Text('     Sign Us     ')),
        ),
      ],
    ),
  );
}
