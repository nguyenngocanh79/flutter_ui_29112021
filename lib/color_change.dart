// import 'package:flutter/material.dart';
//
// // Color palettes: https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
// Map<int, Color> primaryColorSwatch = {
//   50: Color(0xffe8e8f1),
//   100: Color(0xffc5c5dc),
//   200: Color(0xff9fa0c5),
//   300: Color(0xFF7c7bad),
//   400: Color(0xff635f9c),
//   500: Color(0xFF4b4390),
//   600: Color(0xff453c87),
//   700: Color(0xFF3d337b),
//   800: Color(0xFF352970),
//   900: Color(0xff27185c),
// };
// //COMPLEMENTARY
// Map<int, Color> secondaryColorSwatch = {
//   50: Color(0xfffafdf0),
//   100: Color(0xfff4fad9),
//   200: Color(0xffedf7c1),
//   300: Color(0xFFe7f4ad),
//   400: Color(0xffe2ef9f),
//   500: Color(0xFFddeb92),
//   600: Color(0xffd1db8b),
//   700: Color(0xFFbfc482),
//   800: Color(0xFFacad7b),
//   900: Color(0xff8a8772),
// };
//
// Map<int, Color> primaryColor2Swatch = {
//   50: Color(0xfffae9e8),
//   100: Color(0xfffeccc0),
//   200: Color(0xfffdaa98),
//   300: Color(0xFFfe896f),
//   400: Color(0xfffe6e51),
//   500: Color(0xFFff5436),
//   600: Color(0xfff44e32),
//   700: Color(0xFFe5472d),
//   800: Color(0xFFd74129),
//   900: Color(0xffbe3420),
// };
//
// //COMPLEMENTARY
// Map<int, Color> secondaryColor2Swatch = {
//   50: Color(0xffdbf8ff),
//   100: Color(0xffa2edfe),
//   200: Color(0xff51e1fe),
//   300: Color(0xFF00d4fa),
//   400: Color(0xff00c9f4),
//   500: Color(0xFF00bfee),
//   600: Color(0xff00afda),
//   700: Color(0xFF009abe),
//   800: Color(0xFF0087a4),
//   900: Color(0xff006475),
// };
//
// MaterialColor primaryColorCustom = MaterialColor(0xFF7c7bad, primaryColorSwatch);
// MaterialColor secondaryColorCustom = MaterialColor(0xFFacad7b, secondaryColorSwatch);
// // const Color customSecondary = Color(0xFFacad7b);
// final bool secondaryIsDark = (ThemeData.estimateBrightnessForColor(secondaryColorCustom) == Brightness.dark);
//
// // MaterialColor primaryColorCustom = MaterialColor(0xfffe6e51, primaryColor2Swatch);
// // MaterialColor secondaryColorCustom = MaterialColor(0xff51e1fe, secondaryColor2Swatch);
// // // const Color customSecondary = Color(0xff51e1fe);
// // final bool secondaryIsDark = (ThemeData.estimateBrightnessForColor(secondaryColorCustom) == Brightness.dark);
//
// final hsvPrimeColor = HSVColor.fromColor(primaryColorCustom);
// // Nếu primary có tông màu đỏ thì info có màu second, nếu không thì lấy màu đỏ
// final infoColor = (hsvPrimeColor.hue >= 0 && hsvPrimeColor.hue <= 40) || (hsvPrimeColor.hue >= 320 && hsvPrimeColor.hue <= 360)
//     ? secondaryColorCustom : Colors.red;
// Color primaryColor88 = HSLColor.fromColor(primaryColorCustom.shade500).withLightness(0.88).toColor();
// Color primaryColor95 = HSLColor.fromColor(primaryColorCustom.shade500).withLightness(0.95).toColor();
// Color secondaryColor98 = HSLColor.fromColor(secondaryColorCustom.shade500).withLightness(0.98).toColor();
//
//
// /// Thay đổi lightness (shade) của color
// ///
// /// Chỉ có thể nhập HOẶC lightness hoặc lightnessDiff
// ///
// /// lightnessDiff: nếu muốn tăng giảm 1 lượng lightnessDiff từ color
// ///
// /// lightness: nếu muốn set lightness (0 - 1)
// Color colorChangeLight({required Color color, double? lightnessDiff, double? lightness}){
//
//   assert((lightnessDiff != null) ^ (lightness != null)); // XOR
//
//   HSLColor hslColor = HSLColor.fromColor(color);
//   double newLightness = 0;
//   if(lightnessDiff != null){
//     newLightness = hslColor.lightness + lightnessDiff;
//     if(newLightness >= 1) newLightness = 1;
//     if(newLightness <= 0) newLightness = 0;
//   }
//   if(lightness != null){
//     newLightness = lightness;
//   }
//
//   return hslColor.withLightness(newLightness).toColor();
//
// }