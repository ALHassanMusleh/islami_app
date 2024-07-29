import 'package:flutter/material.dart';
import 'package:islami_app/ui/providers/language_provider.dart';
import 'package:islami_app/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/screens/splash/splash.dart';
import 'package:islami_app/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => LanguageProvider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //
  // final String lanuage = "en";
  //
  // setLanguage(String newLangauge){
  //   lanuage=newLangauge;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // Arabic
        Locale('en'), // English
      ],
      locale: Locale(provider.locale),
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
