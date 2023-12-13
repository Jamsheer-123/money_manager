import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appfont.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Expense extends StatelessWidget {
  const Expense({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a map to store expenses based on categories

    return Center(
      child: SizedBox(
        width: 480,
        height: 560,
        child: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
          Map<String, double> expenseMap = {};

          // Calculate total expenses for each category
          for (TransactionModel transaction in state.transactionList) {
            if (transaction.catagoryType == CatagoryType.expense) {
              String categoryName = transaction.catagoryModel.name;
              if (expenseMap.containsKey(categoryName)) {
                expenseMap[categoryName] = (expenseMap[categoryName] ?? 0) +
                    transaction.amount.toDouble();
              } else {
                expenseMap[categoryName] = transaction.amount.toDouble();
              }
            }
          }

          // Convert the expenseMap to a list of ChartData
          List<ChartData> chartData = expenseMap.entries
              .map((entry) => ChartData(entry.key, entry.value))
              .toList();

          return SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                radius: "${MediaQuery.sizeOf(context).width / 3}",
                innerRadius: "${MediaQuery.sizeOf(context).width / 9}",
                dataLabelMapper: (ChartData data, _) => data.x,
                dataLabelSettings: DataLabelSettings(
                    textStyle:
                        AppTextStyle.popin18W600.copyWith(color: Colors.blue),
                    isVisible: true,
                    // Positioning the data label
                    labelPosition: ChartDataLabelPosition.outside),
                explode: true,
                explodeIndex: 1,
                explodeGesture: ActivationMode.singleTap,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
          );
        }

            // Handle other states if needed

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
