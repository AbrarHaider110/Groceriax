import 'package:flutter/material.dart';
import 'package:my_app/Screens/onboardingScreen.dart';

class SplashProvider extends ChangeNotifier {
  late AnimationController controller;
  late Animation<double> animation;

  SplashProvider({
    required TickerProvider vsync,
    required BuildContext context,
  }) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.forward();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboardingscreen()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
