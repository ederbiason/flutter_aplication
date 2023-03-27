import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
import 'package:flutter_aplication/components/square_tile.dart';
import 'package:flutter_aplication/pages/register_password_account.dart';
import 'package:flutter_aplication/services/auth_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthdateController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final name = nameController.text;
      final phoneNumber = phoneNumberController.text;
      final birthdate = birthdateController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPasswordAccount(
            email: email,
            name: name,
            phoneNumber: phoneNumber,
            birthdate: birthdate,
          ),
        ),
      );
    }
  }

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      // if (passwordController.text == confirmPasswordController.text) {
      //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: emailController.text, password: passwordController.text);
      // } else {
      //   showErrorMessage("Passwords don't match!");
      // }

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

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('lib/assets/images/logo.png'),
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
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "E-mail",
                    hintText: "Type your e-mail",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      if (!value.contains('@')) {
                        return "Invalid e-mail!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    controller: nameController,
                    obscureText: false,
                    labelText: "Name",
                    hintText: "Type your name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    controller: phoneNumberController,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    labelText: "Phone Number",
                    hintText: "Type your phone number",
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '+## (##) 9####-####')
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    controller: birthdateController,
                    obscureText: false,
                    keyboardType: TextInputType.datetime,
                    labelText: "Birthdate",
                    hintText: "Type your birthdate",
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '##/##/####')
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: _nextStep,
                    text: "Next Step",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                                thickness: 0.5, color: Colors.grey[400]),
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
                                thickness: 0.5, color: Colors.grey[400]),
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
                      Text("Already have an account?",
                          style: TextStyle(color: Colors.grey[700])),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Login now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  SizedBox(height: 15)
                ],
              ),
            ),
          ),
        )));
  }
}
