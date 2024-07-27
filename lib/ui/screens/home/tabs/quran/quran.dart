import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_constans.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            AppAssets.quranTabLogo,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    height: 3,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          'Name',
                          style: AppStyles.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Verses',
                          style: AppStyles.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    thickness: 3,
                    color: AppColors.primaryColor,
                    height: 3,
                  ),
                  Expanded(child: buildSuraList()),
                ],
              ),
              const VerticalDivider(
                color: AppColors.primaryColor,
                thickness: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSuraList() => ListView.builder(
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Text(
              '${AppConstans.suraNames[index]}',
              style: AppStyles.titleTextStyle,
              textAlign: TextAlign.center,
            )),
            Expanded(
                child: Text(
              '${AppConstans.versesNumber[index]}',
              style: AppStyles.titleTextStyle,
              textAlign: TextAlign.center,
            )),
          ],
        ),
        itemCount: AppConstans.suraNames.length,
      );
}
