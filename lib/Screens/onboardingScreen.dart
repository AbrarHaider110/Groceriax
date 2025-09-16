import 'package:flutter/material.dart';
import 'package:my_app/Providers/OnboardingProvider.dart';
import 'package:provider/provider.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(vsync: this),
      child: Consumer<OnboardingProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/onboarding.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: FadeTransition(
                    opacity: provider.fadeAnimation,
                    child: SlideTransition(
                      position: provider.slideAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              height: 0.8,
                            ),
                          ),
                          const Text(
                            "to our Store",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Get your groceries in as fast as one hour",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 120,
                                vertical: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Provider.of<OnboardingProvider>(
                                context,
                                listen: false,
                              ).goToSignIn(context);
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          const SizedBox(height: 140),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
