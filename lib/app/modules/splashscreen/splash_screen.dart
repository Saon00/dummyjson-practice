import 'package:ecommerce_demo_job_task/app/core/app_images.dart';
import 'package:ecommerce_demo_job_task/app/modules/mainscreen/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Get.offAll(
        const MainScreen(),
        duration: const Duration(seconds: 1),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AppImages.splashImage, scale: 2)),
    );
  }
}
