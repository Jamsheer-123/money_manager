import 'package:flutter/material.dart';
import 'package:money_manager/pages/create.transaction/component/datepickerwidegt.dart';
import 'package:money_manager/utils/space.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
              child: DatepickerWidegt2(
            selctedDate: startDate,
            hinttext: 'Start Date',
          )),
          horizontalSpace(10),
          Expanded(
              child: DatepickerWidegt2(
            selctedDate: endDate,
            hinttext: 'End Date',
          )),
          // ElevatedButton(
          //   onPressed: () => _selectStartDate(context),
          //   child: Text(startDate != null
          //       ? "Start Date: ${startDate!.toLocal()}".split(' ')[0]
          //       : "Select Start Date"),
          // ),
          // ElevatedButton(
          //   onPressed: () => _selectEndDate(context),
          //   child: Text(endDate != null
          //       ? "End Date: ${endDate!.toLocal()}".split(' ')[0]
          //       : "Select End Date"),
          // ),
        ],
      ),
    );
  }
}
