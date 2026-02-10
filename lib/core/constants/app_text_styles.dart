import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goldenprice/core/constants/app_colors.dart' show AppColors;

class AppTextStyles {
  static TextStyle font22SemiBold = GoogleFonts.nunitoSans(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.goldColor,
  
  );

  static TextStyle font17Regular = GoogleFonts.nunitoSans(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
}
