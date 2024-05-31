import 'package:state_management_bloc/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle m3DisplayLarge = GoogleFonts.roboto(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
  );

  TextStyle m3HeadlineSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
     color: ThemeColor().blackColor,
  );

  TextStyle m3BodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
    // color: const Color(0xFF00000),
  );

  TextStyle m3BodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
     color: ThemeColor().m3SysLightPurple60,
  );

  TextStyle m3BodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
     color: ThemeColor().m3SysLightPurple60,
  );

  TextStyle m3LabelLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
     color: ThemeColor().whiteColor,
  );

  TextStyle m3AppBar = GoogleFonts.roboto(
    fontSize: 23,
    fontWeight: FontWeight.w500,
     color: ThemeColor().whiteColor,
  );
}