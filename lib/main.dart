import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_simplified_new/utilities/get_it.dart';
import 'package:tax_simplified_new/utilities/shared_preferences.dart';
import 'package:tax_simplified_new/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(SharedPrefs(), signalsReady: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const MaterialApp(
        title: 'Tax Simplified',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
