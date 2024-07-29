import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ExtensionContext on BuildContext {
  AppLocalizations get local {
    return AppLocalizations.of(this)!;
  }
}

// class X{}
//
// extension ExtensionX on X {
//   test(){
//
//   }
//
//   test2(){
//
//   }
// }
