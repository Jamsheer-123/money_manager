import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/introscreen.png",
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.52,
              fit: BoxFit.contain,
            ),
            RichText(
              // Controls visual overflow
              overflow: TextOverflow.clip,

              // Controls how the text should be aligned horizontally
              textAlign: TextAlign.start,

              // Control the text direction

              // Whether the text should break at soft line breaks
              softWrap: true,

              // Maximum number of lines for the text to span
              maxLines: 3, // Adjust the number of lines as needed

              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Let\'s\nmanage\n',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF232323),
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                    text: 'money',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFF4328),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 1.20,
                    ),
                  ),
                  TextSpan(
                    text: ' with us',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF232323),
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/"),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1.00, 0.01),
                    end: Alignment(-1, -0.01),
                    colors: [Color(0xFFFC0000), Color(0xFFFB5D3A)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
