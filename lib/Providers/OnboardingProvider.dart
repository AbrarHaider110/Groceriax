import 'package:flutter/material.dart';
import 'package:my_app/Screens/Signin.dart';

class OnboardingProvider extends ChangeNotifier {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  OnboardingProvider({required TickerProvider vsync}) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  void goToSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Signin()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
