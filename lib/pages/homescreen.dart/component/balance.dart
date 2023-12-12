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
            children: [
              verticalSpace(20),
              Text(
                "Total Balance",
                style: AppTextStyle.popin15W400
                    .copyWith(color: const Color.fromARGB(255, 227, 223, 223)),
              ),
              Row(
                children: [
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      double resultBalance =
                          calculateBalance(state.transactionList!);

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
        const PPP()

        // Expanded(
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(13),
        //             topRight: Radius.circular(13)),
        //         color: Colors.white),
        //     child: Column(
        //       children: [
        //         verticalSpace(10),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "Recent Transaction",
        //               style: AppTextStyle.nunito16w600,
        //             ),
        //             Text(
        //               "See All",
        //               style: AppTextStyle.nunito16w600,
        //             )
        //           ],
        //         ),
        //         BlocBuilder<TransactionBloc, TransactionState>(
        //           builder: (context, state) {
        //             print({state.transactionList}.toString());
        //             return Expanded(
        //               child: ListView.builder(
        //                 shrinkWrap: true,
        //                 itemCount: state.transactionList?.length ?? 0,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return ListTile(
        //                     leading: Container(
        //                       decoration:
        //                           const BoxDecoration(shape: BoxShape.circle),
        //                       child: SvgPicture.asset(
        //                           state.transactionList?[index].catagoryModel
        //                                   .images ??
        //                               "",
        //                           height: 50,
        //                           width: 50,
        //                           // "assets/catagorysvg/amazon-prime-video.svg",
        //                           fit: BoxFit.cover),
        //                     ),
        //                     trailing: Text(state.transactionList![index].amount
        //                         .toString()),
        //                     title: Text(state.transactionList![index]
        //                         .catagoryModel.categoryField.name),
        //                   );
        //                 },
        //               ),
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // )
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
