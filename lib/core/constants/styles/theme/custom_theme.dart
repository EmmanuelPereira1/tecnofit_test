import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnofit_test/core/constants/styles/colors/app_colors.dart';

class CustomTheme {
  TextStyle headline1() {
    return GoogleFonts.prompt(
        fontSize: 40, color: AppColors.darkBlue);
  }

  TextStyle headline2() {
    return GoogleFonts.prompt(
        fontSize: 32, color: AppColors.darkBlue);
  }

  TextStyle headline3() {
    return GoogleFonts.prompt(
        fontSize: 24, color: AppColors.darkBlue);
  }

  TextStyle montserrat() {
    return GoogleFonts.montserrat(
        fontSize: 16, color: AppColors.darkBlue);
  }
}
