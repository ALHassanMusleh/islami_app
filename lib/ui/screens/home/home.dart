import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/app_radio.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:islami_app/ui/screens/home/tabs/settings/settings.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/extensions/build_context_extensions.dart';
import 'package:islami_app/ui/widgets/app_scaffold.dart';

class Home extends StatefulWidget {
  static const String routeName = 'Home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [Quran(), Ahadeth(), Sebha(), AppRadio(), Settings()];
  @override
  Widget build(BuildContext context) {
    // X().
    return AppScaffold(
      appBarTitle: context.local.islami,
      body: tabs[selectedTabIndex],
      bottomNavigationBar: buildBottomNavigation(),
    );
    // return Container(
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage(AppAssets.lightBackground),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Scaffold(
    //     backgroundColor: AppColors.transparent,
    //     appBar: AppBar(
    //       backgroundColor: AppColors.transparent,
    //       elevation: 0,
    //       title: const Text(
    //         'Islami',
    //         style: AppStyles.appBarStyle,
    //       ),
    //       centerTitle: true,
    //     ),
    //     body: tabs[selectedTabIndex],
    //     bottomNavigationBar: Theme(
    //       data: ThemeData(canvasColor: AppColors.primaryColor),
    //       child: BottomNavigationBar(
    //         selectedItemColor: AppColors.accentColor,
    //         selectedIconTheme: const IconThemeData(size: 38),
    //         unselectedIconTheme: const IconThemeData(size: 34),
    //         currentIndex: selectedTabIndex,
    //         onTap: (index) {
    //           selectedTabIndex = index;
    //           setState(() {});
    //         },
    //         items: const [
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage(AppAssets.icQuran),
    //             ),
    //             label: 'Quran',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage(AppAssets.icAhadeth),
    //             ),
    //             label: 'Ahadth',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage(AppAssets.icSebha),
    //             ),
    //             label: 'Srbha',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage(AppAssets.icRadio),
    //             ),
    //             label: 'Radio',
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Theme buildBottomNavigation() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.primaryColor),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.accentColor,
        selectedIconTheme: const IconThemeData(size: 38),
        unselectedIconTheme: const IconThemeData(size: 34),
        currentIndex: selectedTabIndex,
        onTap: (index) {
          selectedTabIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.icQuran),
            ),
            label: context.local.quran,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.icAhadeth),
            ),
            label: context.local.ahadeth,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.icSebha),
            ),
            label: context.local.sebha,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppAssets.icRadio),
            ),
            label: context.local.radio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: context.local.settings,
          ),
        ],
      ),
    );
  }
}
