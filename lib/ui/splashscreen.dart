import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(Navigation()),
    );
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: Image(
            image: AssetImage('assets/Logo.png'),
          ),
        ),
      ),
    );
  }
}
