import 'package:flutter/material.dart';
import 'package:frontend/utils/router_constants.dart';

import '../utils/colors.dart';
import '../utils/router_constants.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    //dynamic sizes
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(child: Column( 
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
    
              // OTP verification text
               Container(
                  height: sHeight * 0.2,
                  width: sWidth * 0.9,
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: const Text(
                    "OTP verification",
                    style: TextStyle(
                      color: blackish,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                 Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: sHeight * 0.07,
                  child: const Text(
                    "Enter the verification code we just sent on your email address.",
                    style: TextStyle(
                      color: white,
                      // font style to urbanist
                      fontSize: 18,
                    ),
                  ),
                ),
              ), 


              //otp blocks
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Container(
                  padding:const EdgeInsets.all(8),
                  margin:const EdgeInsets.all(8),
                  width: sWidth*0.2,
                  child: const TextField(
                    decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: white),
                      borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                  ),
                  ),
                ),

                Container(
                  padding:const EdgeInsets.all(8),
                  margin:const EdgeInsets.all(8),
                  width: sWidth*0.2,
                  child: const TextField(
                    decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: white),
                      borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                  ),
                  ),
                ),

                Container(
                  padding:const EdgeInsets.all(8),
                  margin:const EdgeInsets.all(8),
                  width: sWidth*0.2,
                  child: const TextField(
                    decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: white),
                      borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                  ),
                  ),
                ),

                Container(
                  padding:const EdgeInsets.all(8),
                  margin:const EdgeInsets.all(8),
                  width: sWidth*0.2,
                  child: const TextField(
                    decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: white),
                      borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                  ),
                  ),
                ),
               ],
              ) , 
               //Verify Button
              Container(
                height: sHeight * 0.08,
                width: sWidth * 0.9,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          blackish)), // remember to give the color in this format otherwise null safety error will be prompted
                  child: const Text(
                    "Verify",
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
    
              //Didn't receive code
              Row(
                // height:sHeight * 0.3,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Didn't receive code?"),
                  TextButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, loginInRoute)
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(color: darkGreen),
                      )),
                ],
              ),

      ])),
    ));
  }
}