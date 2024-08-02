import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/suta_details_args.dart';
import 'package:islami_app/ui/providers/font_size_provider.dart';
import 'package:islami_app/ui/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/extensions/build_context_extensions.dart';
import 'package:islami_app/ui/utils/show_snack_bar.dart';
import 'package:islami_app/ui/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;
  late ThemeProvider themeProvider;
  late FontSizeProvider fontSizeProvider;

  String fileContent = "";
  List<String> listLines = [];
  bool fullSura = true;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    fontSizeProvider = Provider.of(context);
    print('build');
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    print(args.fileName);
    print(args.suraName);
    if (fileContent.isEmpty) readFile();
    return AppScaffold(
      appBarTitle: args.suraName,
      suraTab: true,
      action: IconButton(
        icon: Icon(
          Icons.switch_access_shortcut_add,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          fullSura = !fullSura;
          setState(() {});
        },
      ),
      body: fullSura ? buildFullSuraContent() : buildAyaOfSura(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(args.suraName),
    //   ),
    //   body: Text(
    //     fileContent,
    //     textDirection: TextDirection.rtl,
    //   ),
    // );
  }

  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget buildFullSuraContent() => fileContent.isEmpty
      ? buildLoading()
      : Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: themeProvider.containerColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (args.suraName != "التوبة")
                    Text(
                      'بسم الله الرحمن الرحيم',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontFamily: 'quran_font'),
                    ),
                  const Divider(
                    thickness: 3,
                    height: 2,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    fileContent,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: fontSizeProvider.selectedFontSize,
                        fontFamily: 'quran_font'),
                  ),
                ],
              ),
            ),
          ),
        );

  Widget buildAyaOfSura() {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                FlutterClipboard.copy(listLines[index])
                    .then((value) => showSnackBar(context, context.local.ayaIsCopied));
              },
              icon: Icon(
                Icons.copy_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            Expanded(
              child: Text(
                listLines[index],
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 26, fontFamily: 'quran_font'),
              ),
            ),
          ],
        ),
      ),
      itemCount: listLines.length,
      // separatorBuilder: (context, index) => Container(
      //   margin: EdgeInsets.symmetric(horizontal: 30),
      //   padding: EdgeInsets.all(10),
      //   child: Divider(
      //     thickness: 1.5,
      //     height: 2,
      //     color: AppColors.primaryColor,
      //   ),
      // ),
    );
  }

  // RichText(
  // textDirection: TextDirection.rtl,
  // text: TextSpan(
  // children: _getStyledText(fileContent),
  // ),
  // ),
  // List<TextSpan> _getStyledText(String text) {
  //   final regex = RegExp(r'\d+');
  //   final matches = regex.allMatches(text);
  //   int lastMatchEnd = 0;
  //   List<TextSpan> spans = [];
  //
  //   for (var match in matches) {
  //     if (match.start > lastMatchEnd) {
  //       spans.add(TextSpan(
  //         text: text.substring(lastMatchEnd, match.start),
  //         style: AppStyles.titleTextStyle.copyWith(fontSize: 20),
  //       ));
  //     }
  //     spans.add(TextSpan(
  //       text: match.group(0),
  //       style:AppStyles.titleTextStyle.copyWith(color: AppColors.primaryColor),
  //     ));
  //     lastMatchEnd = match.end;
  //   }
  //
  //   if (lastMatchEnd < text.length) {
  //     spans.add(TextSpan(
  //       text: text.substring(lastMatchEnd),
  //       style:AppStyles.titleTextStyle.copyWith(color: AppColors.primaryColor),
  //     ));
  //   }
  //
  //   return spans;
  // }
  Future<void> readFile() async {
    /// First way to deal with future
    // Future<String> fileContent = rootBundle.loadString("assets/files/quran/${args.fileName}");
    // fileContent.then((value) {
    //   print('1');
    // });
    // print(2);
    /////////////////////////////////////////////////////
    // Second way to deal with future
    fileContent =
        await rootBundle.loadString("assets/files/quran/${args.fileName}");
    listLines = fileContent.split("\n");
    listLines = listLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < listLines.length; i++) {
      listLines[i] += "(${i + 1}) ";
    }
    fileContent = listLines.join();
    setState(() {});
    print(fileContent);
  }
}
