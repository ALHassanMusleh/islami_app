import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/utils/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // run init state only one before build
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Home.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build'); // build method in emlator run 2 times
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
