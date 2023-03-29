import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';

class RegisterPasswordAccount extends StatefulWidget {
  final String email;
  final String name;
  final String phoneNumber;
  final String birthdate;

  const RegisterPasswordAccount(
      {super.key,
      required this.email,
      required this.name,
      required this.phoneNumber,
      required this.birthdate});

  @override
  _RegisterPasswordAccountState createState() =>
      _RegisterPasswordAccountState();
}

class _RegisterPasswordAccountState extends State<RegisterPasswordAccount> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // void _registrarConta() {
  //   if (formKey.currentState!.validate()) {
  //     // Registrar a conta
  //   }
  // }

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: widget.email, password: passwordController.text);
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
                                controller: passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                labelText: "Password",
                                hintText: "Type your password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Required field.";
                                  }
                                  if (value.length < 6) {
                                    return "Password too short.";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              MyTextField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                labelText: "Confirm Password",
                                hintText: "Type your password again",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Required field.";
                                  }
                                  if (value != confirmPasswordController.text) {
                                    return "Passwords don't match!";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                        "I accept the terms of use and Privacy Policy",
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              MyButton(
                                onTap: signUserUp,
                                text: "Sign Up",
                              ),
                            ]))))));
  }
}
