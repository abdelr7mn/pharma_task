// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum LanguageType {
  ARABIC,
  ENGLISH,
}

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALIZATIONS = "assets/translations";

const Locale ARABIC_LOCALE = Locale("ar", "SA");
const Locale ENGLISH_LOCALE = Locale("en", "US");

extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }

  int get id => getValue() == ARABIC ? 1 : 2;

  Locale get languageLocal => getValue() == ARABIC ? ARABIC_LOCALE : ENGLISH_LOCALE;

}
