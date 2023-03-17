import 'package:flutter/material.dart';
import 'package:flutter_aplication/components/my_button.dart';
import 'package:flutter_aplication/components/my_textfield.dart';
import 'package:flutter_aplication/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E1429),
        body: SafeArea(
            child: Center(
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
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),

              SizedBox(height: 10,),

              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.grey[600])
                    )
                  ],
                )
              ),

              SizedBox(height: 25,),

              MyButton(
                onTap: signUserIn,
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
                    "Not a member?",
                    style: TextStyle(color: Colors.grey[700])
                  ),
                  
                  SizedBox(width: 4),

                  Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.blue, 
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              )
            ],
          ),
        )));
  }
}
