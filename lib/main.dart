import 'package:flutter/material.dart';
import 'package:kuisprakmobile/halaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis Praktikum Mobile',
      theme: ThemeData(),
      home: const HalamanUtama(),
    );
  }
}
