import 'package:flutter/material.dart';
import 'package:my_app/Providers/SplashProvider.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(vsync: this, context: context),
      child: Consumer<SplashProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.green,
            body: Center(
              child: ScaleTransition(
                scale: provider.animation,
                child: FadeTransition(
                  opacity: provider.animation,
                  child: Image.asset("assets/SplashScreen.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
