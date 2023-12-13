import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appfont.dart';
import 'package:money_manager/utils/logout.dialoge.dart';
import 'package:money_manager/utils/space.dart';
import 'package:money_manager/utils/validators.utils.dart';

import 'component.dart/datewidget.dart';

class TranSactionScreeen extends StatefulWidget {
  const TranSactionScreeen({Key? key}) : super(key: key);

  @override
  _TranSactionScreeenState createState() => _TranSactionScreeenState();
}

class _TranSactionScreeenState extends State<TranSactionScreeen> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Payment History"),
        ),
        body: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            print({state.transactionList}.toString());
            List<TransactionModel>? filteredTransactions =
                _filterTransactions(state.transactionList);

            return Column(
              children: [
                verticalSpace(5),
                DateWidget(
                  startDate: startDate,
                  endDate: endDate,
                  onStartDateSelected: () => _selectStartDate(context),
                  onEndDateSelected: () => _selectEndDate(context),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredTransactions?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        background: Container(color: Colors.red),
                        key: Key(state.transactionList[index].id ?? ""),
                        onDismissed: (direction) {},
                        confirmDismiss: (direction) async {
                          var a = conformDelete(
                              context, state.transactionList[index].id ?? "");
                          log(a.toString());
                          return a;
                        },
                        child: ListTile(
                          leading: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              filteredTransactions?[index]
                                      .catagoryModel
                                      .images ??
                                  "",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          trailing: Text(
                            "${filteredTransactions?[index].catagoryType == CatagoryType.income ? "+" : "-"} ₹ ${filteredTransactions?[index].amount.toString()}",
                            style: AppTextStyle.nunito16w600.copyWith(
                                color:
                                    filteredTransactions?[index].catagoryType ==
                                            CatagoryType.income
                                        ? Colors.green
                                        : Colors.red),
                          ),
                          subtitle: Text(DateFormat.yMMMd()
                              .format(filteredTransactions![index].date)),
                          title: Text(
                            capitalize(
                                filteredTransactions[index].catagoryModel.name),
                            style: AppTextStyle.nunito18w700,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<TransactionModel>? _filterTransactions(
      List<TransactionModel>? transactions) {
    if (startDate == null && endDate == null) {
      return transactions;
    }

    List<TransactionModel>? filteredList = transactions
        ?.where((transaction) =>
            (startDate == null || transaction.date.isAfter(startDate!)) &&
            (endDate == null || transaction.date.isBefore(endDate!)))
        .toList();

    return filteredList;
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != startDate) {
      DateTime selectedStartDate = picked.subtract(const Duration(seconds: 1));

      setState(() {
        startDate = selectedStartDate;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != endDate) {
      DateTime selectedStartDate = picked.add(const Duration(seconds: 1));

      setState(() {
        endDate = picked;
      });
    }
  }
}
