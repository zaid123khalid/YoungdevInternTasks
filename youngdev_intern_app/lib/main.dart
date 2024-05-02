import 'package:flutter/material.dart';
import 'package:youngdev_intern_app/about_page.dart';
import 'package:youngdev_intern_app/home_page.dart';
import 'package:youngdev_intern_app/internships_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Young Dev Intern App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/internships": (context) => const InternshipPage(),
        "/about": (context) => const AboutPage(),
      },
      initialRoute: '/',
    );
  }
}
