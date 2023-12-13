import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appfont.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 480,
        height: 560,
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            double totalIncome = 0;
            double totalExpense = 0;

            // Calculate total income and expense for the current month
            final now = DateTime.now();
            final firstDayOfMonth = DateTime(now.year, now.month, 1);

            for (TransactionModel transaction in state.transactionList) {
              if (transaction.date.isAfter(firstDayOfMonth)) {
                if (transaction.catagoryType == CatagoryType.income) {
                  totalIncome += transaction.amount.toDouble();
                } else if (transaction.catagoryType == CatagoryType.expense) {
                  totalExpense += transaction.amount.toDouble();
                }
              }
            }

            // Calculate profit (income - expense)
            double profit = totalIncome - totalExpense;

            List<ChartData> chartData = [
              ChartData('Income', totalIncome),
              ChartData('Expense', totalExpense),
              ChartData('Profit/Loss', profit),
            ];

            return SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                  dataLabelMapper: (ChartData data, _) => data.x,
                  dataLabelSettings: DataLabelSettings(
                    textStyle:
                        AppTextStyle.popin18W600.copyWith(color: Colors.blue),
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                  radius: "${MediaQuery.sizeOf(context).width / 3}",
                  innerRadius: "${MediaQuery.sizeOf(context).width / 9}",
                  explode: true,
                  explodeIndex: 2, // Explode the "Profit/Loss" slice
                  explodeGesture: ActivationMode.singleTap,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
