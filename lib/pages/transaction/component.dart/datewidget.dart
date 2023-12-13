import 'package:flutter/material.dart';
import 'package:money_manager/pages/create.transaction/component/datepickerwidegt.dart';
import 'package:money_manager/utils/space.dart';

class DateWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final VoidCallback onStartDateSelected;
  final VoidCallback onEndDateSelected;

  const DateWidget({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: onStartDateSelected,
            child: DatepickerWidegt2(
              selctedDate: startDate,
              hinttext: 'Start Date',
            ),
          )),
          horizontalSpace(10),
          Expanded(
              child: InkWell(
            onTap: onEndDateSelected,
            child: DatepickerWidegt2(
              selctedDate: endDate,
              hinttext: 'End Date',
            ),
          )),
        ],
      ),
    );
  }
}
