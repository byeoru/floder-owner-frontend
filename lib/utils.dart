import 'package:floder_owner/constants/sizes.dart';
import 'package:flutter/material.dart';

class Utils {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static void materialPush({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  static double appHorizontalPaddingSize = Sizes.size5;
}
