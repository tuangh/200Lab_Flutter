import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.light(secondary: kSecondaryLightColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.dark(
      secondary: kSecondaryDarkColor,
    ),
  );
}
