import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
import 'package:flutter_aplication/components/square_tile.dart';
import 'package:flutter_aplication/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(message));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E1429),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset('lib/assets/images/logo.png'),
                SizedBox(
                  height: 50,
                ),
                Text("Welcome to the OPA app! UniFil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: "Type your e-mail",
                  obscureText: false,
                  labelText: "E-mail",
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: "Type your password",
                  obscureText: true,
                  labelText: "Password",
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password ?",
                            style: TextStyle(color: Colors.grey[600]))
                      ],
                    )),
                SizedBox(
                  height: 25,
                ),
                MyButton(
                  onTap: signUserIn,
                  text: "Sign In",
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                              Divider(thickness: 0.5, color: Colors.grey[400]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child:
                              Divider(thickness: 0.5, color: Colors.grey[400]),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/assets/images/google.png',
                      height: 40,
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/assets/images/facebook.png',
                      height: 45,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Register now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
