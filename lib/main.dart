import 'package:ecommerce_demo_job_task/app/core/appsize.dart';
import 'package:ecommerce_demo_job_task/app/modules/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
    );
  }
}
