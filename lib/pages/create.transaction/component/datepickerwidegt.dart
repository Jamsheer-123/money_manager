// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/utils/appfont.dart';

import '../../../utils/space.dart';

class DatepickerWidegt extends StatelessWidget {
  DatepickerWidegt({super.key, required this.selctedDate});
  DateTime? selctedDate;
  var dateFormat = DateFormat('dd-MMMM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SvgPicture.asset("assets/svg/calendar.svg"),
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start Date",
                  style: AppTextStyle.nunito16w600
                      .copyWith(color: const Color(0xff6e6a7c), fontSize: 14),
                ),
                selctedDate == null
                    ? Text("Choose your date",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 15))
                    : Text(
                        // controller.selectedDate.toString(),
                        dateFormat.format(selctedDate!).toString(),
                        // DateFormat('dd-MMM-yyyy')
                        //     .format(controller.selectedDate!),
                        style: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.w400, fontSize: 15)),
              ],
            )
          ]),
          SvgPicture.asset("assets/svg/arrow_downbold.svg"),
        ],
      ),
    );
  }
}

class DatepickerWidegt2 extends StatelessWidget {
  DatepickerWidegt2(
      {super.key, required this.selctedDate, required this.hinttext});
  final String hinttext;
  DateTime? selctedDate;
  var dateFormat = DateFormat('dd-MMMM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(children: [
              SvgPicture.asset("assets/svg/calendar.svg"),
              horizontalSpace(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hinttext,
                      style: AppTextStyle.nunito16w600.copyWith(
                          color: const Color(0xff6e6a7c), fontSize: 14),
                    ),
                    selctedDate == null
                        ? Text("Choose your date",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 12))
                        : Text(
                            // controller.selectedDate.toString(),
                            dateFormat.format(selctedDate!).toString(),
                            // DateFormat('dd-MMM-yyyy')
                            //     .format(controller.selectedDate!),
                            style: GoogleFonts.lexendDeca(
                                fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
