import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:niyam/firebase_options.dart';
import 'package:niyam/screens/splashscreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balaji Dham',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
