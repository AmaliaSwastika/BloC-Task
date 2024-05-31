import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;

  const DetailPage({required this.imageUrl, Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.brown,
      title: const Text(
        'Detail Menu',
        style: TextStyle(
          color: Colors.white, 
        ),
      ),
       centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white), 
    ),
    body: Center(
      child: Image.network(imageUrl),
    ),
  );
}
}