// ignore_for_file: use_key_in_widget_constructors, camel_case_types, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/view/home_screen.dart';
import 'package:page_transition/page_transition.dart';
class Splash_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return
      AnimatedSplashScreen(
        duration: 7000,
        splash: Lottie.asset('assets/images/n.jpg'),

        nextScreen:const HomeScreen (),
        splashIconSize: 280,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,

      );
  }

}