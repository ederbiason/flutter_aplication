import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
import 'package:flutter_aplication/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    try {
      if(passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text
        );
      } else {
        showErrorMessage("Passwords don't match!");
      }
      
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text(message));
    });
  }

  void wrongPasswordMessage() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(title: Text("Incorrect Password"));
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
          
                Image.asset(
                  'lib/assets/images/logo.png'
                ),
          
                SizedBox(
                  height: 20,
                ),
          
                Text("Let's create an account for you!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
          
                SizedBox(
                  height: 25,
                ),
          
                MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false,
                ),
          
                SizedBox(height: 10,),
          
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                SizedBox(height: 10,),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
          
                SizedBox(height: 25,),
          
                MyButton(
                  onTap: signUserUp,
                  text: "Sign Up",
                ),
          
                SizedBox(height: 50,),
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400]
                        ),
                      ),
                    ],
                  )
                ),
          
                SizedBox(height: 20,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/assets/images/google.png',
                      height: 40,
                    ),
          
                    SizedBox(height: 25, width: 25,),
          
                    SquareTile(
                      imagePath: 'lib/assets/images/facebook.png',
                      height: 45,
                    ),
                  ],
                ),
          
                SizedBox(height: 10,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700])
                    ),
                    
                    SizedBox(width: 4),
          
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: Colors.blue, 
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
