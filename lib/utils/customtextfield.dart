// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/appfont.dart';
import '../../../utils/space.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      // required this.controller,
      required this.hintText,
      required this.keybord,
      required this.controls,
      this.validator,
      required this.color,
      required this.counterText})
      : super(key: key);
  final String counterText;
  final TextEditingController controls;
  final Color color;
  final TextInputType keybord;
  // final LoginController controller;
  final String hintText;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            counterText,
            style: AppTextStyle.nunito16w600,
          ),
          verticalSpace(5),
          TextFormField(
            autocorrect: false,
            enableSuggestions: false,
            // style: poppinsHeader.copyWith(
            //     color: Colors.white, fontWeight: FontWeight.w600),
            validator: validator,
            controller: controls,
            keyboardType: keybord,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF767D8F),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  CustomPasswordTextField(
      {Key? key,
      // required this.controller,
      required this.obscureFunction,
      required this.hintText,
      required this.keybord,
      required this.controls,
      this.validator,
      required this.obscureText,
      required this.counterText})
      : super(key: key);
  final TextEditingController controls;
  final bool obscureText;
  final TextInputType keybord;
  void Function() obscureFunction;
  final String counterText;

  // final LoginController controller;
  final String hintText;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            counterText,
            style: AppTextStyle.nunito16w600,
          ),
          verticalSpace(5),
          TextFormField(
            obscureText: obscureText,
            // style: poppinsHeader.copyWith(
            //     color: Colors.white, fontWeight: FontWeight.w600),
            validator: validator,
            controller: controls,
            keyboardType: keybord,
            decoration: InputDecoration(
              suffixIcon: TextButton(
                child: Text(
                  obscureText ? "Show" : "Hide",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF767D8F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  obscureFunction();
                  print(obscureText.toString());
                },
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                gapPadding: 7,
                borderSide:
                    const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF767D8F),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            ),
          ),
        ],
      ),
    );
  }
}

//  TextFormField(
//         obscureText: obscureText,
//         style: GoogleFonts.poppins(
//           color: const Color(0xFF767D8F),
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//         ),
//         validator: validator,
//         controller: controls,
//         keyboardType: keybord,
//         decoration: InputDecoration(
//
//           border: InputBorder.none,
//           hintText: hintText,
//           hintStyle: GoogleFonts.poppins(
//             color: const Color(0xFF767D8F),
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
//         ),
//       ),
