import 'package:flutter/material.dart';
import 'package:frontend/utils/router_constants.dart';

import '../utils/colors.dart';
import '../utils/router_constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  
  //controllers
  final emailController =
      TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    //dynamic sizes
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: sHeight * 0.01,
              ),
    
              // back icon
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
    
              SizedBox(
                height: sHeight * 0.03,
              ),
    
              // Forgot Password text
               Container(
                  height: sHeight * 0.2,
                  width: sWidth * 0.9,
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: blackish,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              
              //lower font in white
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: sHeight * 0.07,
                  child: const Text(
                    "Don't worry! It occurs. Please enter "
                    "the email address linked with your account.",
                    style: TextStyle(
                      color: white,
                      // font style to urbanist
                      fontSize: 18,
                    ),
                  ),
                ),
              ), 

              // TextField-email
              SizedBox(
                height: sHeight * 0.1,
                width: sWidth * 0.9,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: blackish),
                      borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                  ),
                ),
              ),
    
             
              //Send code Button
              Container(
                height: sHeight * 0.08,
                width: sWidth * 0.9,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ElevatedButton(
                  onPressed:  () => {
                            Navigator.pushNamed(context,otpScreenRoute)
                          },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          blackish)), // remember to give the color in this format otherwise null safety error will be prompted
                  child: const Text(
                    "Send code",
                    style: TextStyle(color: darkOrange),
                  ),
                ),
              ),
    
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sHeight * 0.03,
                  ),
                ],
              ),
    
              
              SizedBox(
                height: sHeight * 0.02,
              ),
    
              //Remember password login now
              Row(
                // height:sHeight * 0.3,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Remember Password?"),
                  TextButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, loginInRoute)
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: darkGreen),
                      )),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
