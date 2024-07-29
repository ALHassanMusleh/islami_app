import 'package:flutter/material.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';

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

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    print('build'); // build method in emlator run 2 times
    return Scaffold(
      body: Image.asset(
        themeProvider.mainSplashBackground,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
