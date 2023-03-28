import 'package:flutter/material.dart';
import 'package:flutter_aplication/pages/login_page.dart';
import 'package:flutter_aplication/pages/register_page.dart';
import 'package:flutter_aplication/pages/register_password_account.dart';

class LoginOrRegisterPage extends StatefulWidget {
  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}