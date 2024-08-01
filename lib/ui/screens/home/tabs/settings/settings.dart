import 'package:flutter/material.dart';
import 'package:islami_app/ui/providers/font_size_provider.dart';
import 'package:islami_app/ui/providers/language_provider.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/ui/utils/extensions/build_context_extensions.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // String selectedLanguage = "en";
  // bool isDarkThemeEnable = false;
  double fontSize = 10.0;
  late LanguageProvider provider;
  late ThemeProvider themeProvider;
  late FontSizeProvider fontSizeProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);
    fontSizeProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.local.language,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 10,
          ),
          buildLanguageDropdown(),
          SizedBox(
            height: 10,
          ),
          buildThemeSwitch(),
          SizedBox(
            height: 10,
          ),
          Text(
            context.local.fontSize,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Slider(
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.black,
            min: 10.0,
            max: 100.0,
            value: fontSizeProvider.selectedFontSize,
            divisions: 9,
            label: '${fontSizeProvider.selectedFontSize.round()}',
            onChanged: (value) {
              setState(() {
                fontSizeProvider.setFontSize = value;
              });
            },
          )
        ],
      ),
    );
  }

  Widget buildLanguageDropdown() => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
          // value: selectedLanguage,
          // value: provider.locale,
          value: provider.selectedLanguage,
          onChanged: (value) {
            // selectedLanguage = value ?? selectedLanguage;
            // provider.locale = value ?? provider.locale;
            // provider.notifyListeners();
            // setState(() {});
            provider.newLanguage = value ?? provider.selectedLanguage;
            print(value);
          },
          isExpanded: true, //Expanded drop down as with
          padding: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(10),
          dropdownColor: AppColors.primaryColor,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

          items: const [
            DropdownMenuItem(
              value: 'ar',
              child: Text('العربية'),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text('English'),
            ),
          ],
        ),
      );

  Widget buildThemeSwitch() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.local.theme,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Switch(
            activeColor: AppColors.primaryColor,
            // value: isDarkThemeEnable,
            value: themeProvider.isDarkThemeEnables,
            onChanged: (value) {
              // isDarkThemeEnable = value;
              themeProvider.newTheme = value ? ThemeMode.dark : ThemeMode.light;
              setState(() {});
            },
          ),
        ],
      );
}
