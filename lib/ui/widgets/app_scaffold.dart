import 'package:flutter/material.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  AppScaffold(
      {super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themeProvider.mainBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(
            appBarTitle ?? "",
          ),
          centerTitle: true,
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
