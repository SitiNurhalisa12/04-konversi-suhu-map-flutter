import 'package:flutter/material.dart';
import 'package:konversi_suhu_map_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu || Siti Nurhalisa'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
