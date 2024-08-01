import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/model/suta_details_args.dart';
import 'package:islami_app/ui/providers/font_size_provider.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/ui/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'HadethDetails';
  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late ThemeProvider themeProvider;
  late FontSizeProvider fontSizeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    fontSizeProvider = Provider.of(context);
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return AppScaffold(
        appBarTitle: hadeth.title, body: buildHadethContent(hadeth.content));
  }

  Widget buildHadethContent(String content) => Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: themeProvider.containerColor,
              borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(
            child: Text(
              content,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: fontSizeProvider.selectedFontSize),
            ),
          ),
        ),
      );
}
