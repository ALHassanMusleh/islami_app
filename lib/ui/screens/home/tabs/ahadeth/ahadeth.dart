import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_constans.dart';
import 'package:islami_app/ui/utils/app_styles.dart';
import 'package:islami_app/ui/utils/extensions/build_context_extensions.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> hadethList = [];
  @override
  void initState() {
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
              AppAssets.ahadethTabLogo,
            )),
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
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    height: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                   Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.local.hadethName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    height: 3,
                    thickness: 3,
                    color: AppColors.primaryColor,
                  ),
                  Expanded(child: buildAhadethList()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString(AppConstans.hadethFilePath);
    List<String> ahadethAsStrings = ahadethFileContent.split("#\r\n");
    for (int i = 0; i < ahadethAsStrings.length; i++) {
      String hadeth = ahadethAsStrings[i];
      List<String> hadethLines = hadeth.split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join();
      hadethList.add(Hadeth(hadethName.trim(), hadethContent));
    }
    setState(() {});
  }

  Widget buildAhadethList() => hadethList.isEmpty
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: hadethList.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: hadethList[index]);
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      hadethList[index].title,
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.displayLarge,
                    )),
                  ],
                ),
              ));
}
