import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/suta_details_args.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/ui/widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    print('build');
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    print(args.fileName);
    print(args.suraName);
    if (fileContent.isEmpty) readFile();
    return AppScaffold(
      appBarTitle: args.suraName,
      body: fileContent.isEmpty ? buildLoading() : buildSuraContent(),
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
    ));
  }

  Widget buildSuraContent() => Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width * .9,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (args.suraName != "التوبة")
                  const Text(
                    'بسم الله الرحمن الرحيم',
                    style: AppStyles.titleTextStyle,
                  ),
                const Divider(
                  thickness: 3,
                  height: 2,
                  color: AppColors.primaryColor,
                ),
                Text(
                  fileContent,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppStyles.titleTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );

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
    List<String> listLines = fileContent.split("\n");
    listLines = listLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < listLines.length; i++) {
      listLines[i] += "(${i + 1}) ";
    }
    fileContent = listLines.join();
    setState(() {});
    print(fileContent);
  }
}
