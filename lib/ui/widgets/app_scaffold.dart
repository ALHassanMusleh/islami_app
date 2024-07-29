import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_styles.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  const AppScaffold(
      {super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.lightBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          foregroundColor: AppColors.accentColor,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Text(
            appBarTitle ?? "",
            style: AppStyles.appBarStyle,
          ),
          centerTitle: true,
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
