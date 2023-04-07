import 'dart:js';

import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';

import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/meals_detail_screen.dart';
import 'package:frontend/screens/otp_verification_screen.dart';
import 'package:frontend/screens/recipe_post_screen.dart';
import 'package:frontend/screens/recipe_step_screen.dart';
import 'package:frontend/screens/reset_password_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/utils/router_constants.dart';

import 'package:frontend/utils/globals.dart' as globals;

class Router {
static Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case signUpRoute:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case loginInRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case forgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
    case otpScreenRoute:
      return MaterialPageRoute(builder: (context) => const OtpScreen());  
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const Home());  
    case productDetailScreenRoute:
      return MaterialPageRoute(builder: (context) => const ProductDetailScreen());  
    case recipePostScreenRoute:
      return MaterialPageRoute(builder: (context) =>  AddRecipeScreen(steps: globals.allData,)); 
    case stepScreenRoute:
      return MaterialPageRoute(builder: (context) => AddStepScreen())  ;
    default:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
  }
}
}