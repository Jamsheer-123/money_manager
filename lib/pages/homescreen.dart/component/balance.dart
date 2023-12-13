import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appfont.dart';
import 'package:money_manager/utils/space.dart';

import 'flchart.dart';

class BalanceComponent extends StatelessWidget {
  const BalanceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text(
                "Total Balance",
                style: AppTextStyle.popin15W400.copyWith(color: Colors.black),
              ),
              Row(
                children: [
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      double resultBalance =
                          calculateBalance(state.transactionList);

                      return Text(
                        "$resultBalance",
                        style: AppTextStyle.popin20W500.copyWith(
                            color:
                                0 < resultBalance ? Colors.green : Colors.red),
                      );
                    },
                  ),
                  horizontalSpace(10),
                  Text(
                    "(Last 90 Days)",
                    style:
                        AppTextStyle.popin16W600.copyWith(color: Colors.green),
                  )
                ],
              ),
            ],
          ),
        ),
        //  const LineChartSample2(),
        const FLChart()
      ],
    );
  }
}

double calculateBalance(List<TransactionModel> transactions) {
  double totalIncome = 0;
  double totalExpenses = 0;

  for (var transaction in transactions) {
    log("3456789///////////");
    if (transaction.catagoryType == CatagoryType.income) {
      log("//////////////////");
      totalIncome += transaction.amount;
    } else if (transaction.catagoryType == CatagoryType.expense) {
      totalExpenses += transaction.amount;
    }
  }

  double balance = totalIncome - totalExpenses;
  return balance;
}
