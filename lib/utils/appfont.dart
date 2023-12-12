import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle popin18W600 = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);

  static TextStyle popin20W500 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 43,
    fontWeight: FontWeight.bold,
  );
  static TextStyle popin15W400 = GoogleFonts.poppins(
    color: const Color(0xFF6C6C6C),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle popin16W600 = GoogleFonts.poppins(
    color: const Color(0xFFFEFEFE),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle nunito16w600 = GoogleFonts.nunito(
    color: const Color(0xFF343434),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle nunito14w700 = GoogleFonts.nunito(
    color: const Color(0xFF121212),
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.07,
  );
  static TextStyle nunito12w400 = GoogleFonts.nunito(
    color: const Color(0xFF66707A),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.06,
  );
  static TextStyle nunito18w700 = GoogleFonts.nunito(
    color: const Color(0xFF1E1E1E),
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle nunito13w400 = GoogleFonts.nunito(
    color: const Color(0xFF474B51),
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}
