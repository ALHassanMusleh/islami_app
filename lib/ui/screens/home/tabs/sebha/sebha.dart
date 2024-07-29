import 'package:flutter/material.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';

import 'package:islami_app/ui/utils/app_constans.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int sebhaCounter = 0;
  int indexOfAdkar = 0;
  double rotationAngle = 0.0;

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('click');
                  rotateImage();
                  sebhaCounterCases();
                },
                child: Transform.rotate(
                  angle: rotationAngle * 3.1415926535897932,
                  child: Image.asset(
                    themeProvider.sebhabody,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                child: Image.asset(
                  themeProvider.sebhaHead,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: themeProvider.containerSebhaColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '$sebhaCounter',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: themeProvider.containerSebhaColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  AppConstans.adkar[indexOfAdkar],
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void sebhaCounterCases() {
    if (sebhaCounter == 33) {
      sebhaCounter = 0;
      if (indexOfAdkar == AppConstans.adkar.length - 1) {
        print("set index");
        indexOfAdkar = 0;
        print(indexOfAdkar);
        setState(() {});
      } else {
        indexOfAdkar++;
        print(indexOfAdkar);
      }
    } else {
      sebhaCounter++;
    }
    setState(() {});
  }

  void rotateImage() {
    setState(() {
      rotationAngle += 0.25; // Rotate by 45 degrees
    });
  }
}
