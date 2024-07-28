import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/screens/splash/splash.dart';
import 'package:islami_app/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        SuraDetails.routeName: (_) =>  SuraDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
