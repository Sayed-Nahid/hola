import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hola/colors.dart';
import 'package:hola/features/landing/screens/landing_screen.dart';
import 'package:hola/firebase_options.dart';
import 'package:hola/responsive/responsive_layout.dart';
import 'package:hola/router.dart';
import 'package:hola/screens/mobile_layout_screen.dart';
import 'package:hola/screens/mobile_screen_layout.dart';
import 'package:hola/screens/web_layout_screen.dart';
import 'package:hola/screens/web_screen_layout.dart';
import 'package:hola/utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      const ProviderScope(
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen()
    );
  }
}