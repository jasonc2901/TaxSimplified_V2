import 'package:flutter/material.dart';
import 'package:tax_simplified_new/config/colours.dart';
import 'package:tax_simplified_new/views/home.dart';
import 'package:tax_simplified_new/views/landing_page.dart';

import '../utilities/get_it.dart';
import '../utilities/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initialize() async {
    bool firstOpen = !(await getIt<SharedPrefs>().getBool('hasBeenOpened'));
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => firstOpen ? const LandingPage() : const HomePage(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: darkPurple,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: orangeColor,
          color: greyColor,
        ),
      ),
    );
  }
}
