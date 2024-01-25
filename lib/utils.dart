import 'package:floder_owner/constants/sizes.dart';
import 'package:flutter/material.dart';

class Utils {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static double appHorizontalPaddingSize = Sizes.size5;
}
