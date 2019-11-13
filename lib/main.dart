import 'package:flutter/material.dart';

import 'pages/galleryPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devsteam test',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: GalleryPage()
    );
  }
}



