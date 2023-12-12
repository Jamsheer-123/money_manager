import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var dateFormat = DateFormat('dd-MMMM-yyyy');

Future<DateTime> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );

  if (picked != null) {
    return picked;
  } else {
    return DateTime.now();
  }
}
