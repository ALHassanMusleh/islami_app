import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_constans.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int sebhaCounter = 0;
  int indexOfAdkar = 0;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    AppAssets.bodyOfSebha,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AppAssets.headOfSebha,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              const Text(
                'عدد التسبيحات',
                style: AppStyles.titleTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '$sebhaCounter',
                  style: AppStyles.titleTextStyle,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '${AppConstans.adkar[indexOfAdkar]}',
                  textDirection: TextDirection.rtl,
                  style: AppStyles.titleTextStyle.copyWith(
                      color: AppColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
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
