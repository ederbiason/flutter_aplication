import 'package:flutter/material.dart';
import 'package:flutter_aplication/pages/login_page.dart';

import 'home_controller.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}