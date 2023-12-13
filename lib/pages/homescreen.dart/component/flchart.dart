// import 'dart:developer';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
// import 'package:money_manager/model/catagory.model/catagory.model.dart';
// import 'package:money_manager/model/transaction.model/transaction.model.dart';
// import 'package:money_manager/pages/homescreen.dart/component/q.dart';
// import 'package:money_manager/utils/appcolors.dart';

// class FLChart extends StatefulWidget {
//   const FLChart({super.key});

//   @override
//   State<FLChart> createState() => _FLChartState();
// }

// class _FLChartState extends State<FLChart> {
//   List<Color> gradientColors = [
//     AppColors.contentColorCyan,
//     AppColors.contentColorBlue,
//   ];

//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 0.90,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               right: 18,
//               left: 12,
//               // top: 24,
//               bottom: 12,
//             ),
//             child: BlocBuilder<TransactionBloc, TransactionState>(
//               builder: (context, state) {
//                 log("----------start------>>");
//                 DateTime currentDate = DateTime.now();
//                 DateTime startDate =
//                     currentDate.subtract(const Duration(days: 90));

//                 List<TransactionModel> last90DaysTransactions = state
//                     .transactionList
//                     .where((transaction) =>
//                         transaction.date.isAfter(startDate) &&
//                         transaction.date.isBefore(currentDate))
//                     .toList();

//                 // Calculate balance for each day within the last 90 days
//                 List<FlSpot> balanceSpots = [];
//                 double balance = 0;

//                 for (int i = 0; i < last90DaysTransactions.length; i++) {
//                   TransactionModel transaction = last90DaysTransactions[i];
//                   balance += transaction.catagoryType == CatagoryType.expense
//                       ? -transaction.amount
//                       : transaction.amount;
//                   balanceSpots.add(FlSpot(i.toDouble(), balance / 10));
//                 }

//                 double maxX = last90DaysTransactions.length.toDouble();

//                 // Calculate maxY for the y-axis
//                 double maxY = calculateMaxY(last90DaysTransactions);
//                 double minY =
//                     -maxY * 1.1; // Ensure minY is negative for expenses
//                 log("----------end------>>");
//                 return LineChart(
//                     swapAnimationCurve: Curves.bounceIn,
//                     swapAnimationDuration: const Duration(seconds: 2),
//                     LineChartData(
//                       gridData: FlGridData(
//                         drawVerticalLine: true,
//                         horizontalInterval: 5000,
//                         verticalInterval: 2,
//                         getDrawingHorizontalLine: (value) {
//                           return FlLine(
//                             color: AppColors.contentColorBlue,
//                             strokeWidth: 1,
//                           );
//                         },
//                         getDrawingVerticalLine: (value) {
//                           return FlLine(
//                             color: AppColors.contentColorBlue,
//                             strokeWidth: 1,
//                           );
//                         },
//                       ),
//                       titlesData: FlTitlesData(
//                         show: true,
//                         rightTitles: AxisTitles(
//                           sideTitles: SideTitles(showTitles: false),
//                         ),
//                         topTitles: AxisTitles(
//                           sideTitles: SideTitles(showTitles: false),
//                         ),
//                         bottomTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 30,
//                             interval: 1,
//                             getTitlesWidget: bottomTitleWidgets,
//                           ),
//                         ),
//                         leftTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             interval: 1,
//                             getTitlesWidget: leftTitleWidgets,
//                             reservedSize: 42,
//                           ),
//                         ),
//                       ),
//                       borderData: FlBorderData(
//                         show: false,
//                         border: Border.all(color: const Color(0xff37434d)),
//                       ),
//                       minX: 0,
//                       maxX: balanceSpots.length.toDouble(),
//                       minY: -999,
//                       maxY: 999,
//                       lineBarsData: [
//                         LineChartBarData(
//                           aboveBarData: BarAreaData(),
//                           spots: balanceSpots,
//                           // spots: [
//                           //   const FlSpot(0, 3),
//                           //   const FlSpot(2.6, 2),
//                           //   const FlSpot(4.9, 5),
//                           //   const FlSpot(6.8, 3.1),
//                           //   const FlSpot(8, 4),
//                           //   const FlSpot(9.5, 3),
//                           //   const FlSpot(11, 4),
//                           // ],
//                           isCurved: true,
//                           gradient: LinearGradient(
//                             colors: gradientColors,
//                           ),
//                           barWidth: 5,
//                           isStrokeCapRound: true,
//                           dotData: FlDotData(
//                             show: false,
//                           ),
//                           belowBarData: BarAreaData(
//                             show: true,
//                             gradient: LinearGradient(
//                               colors: gradientColors
//                                   .map((color) => color.withOpacity(0.2))
//                                   .toList(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ));
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = const Text('MAR');
//         break;
//       case 5:
//         text = const Text('JUN');
//         break;
//       case 8:
//         text = const Text('SEP');
//         break;
//       default:
//         text = const Text('');
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: text,
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     var style = const TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case -1000:
//         text = '-5K';
//         break;
//       case 0:
//         text = '0';
//         break;
//       case 1000:
//         text = '5K';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.left);
//   }
// }
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appcolors.dart';

class FLChart extends StatefulWidget {
  const FLChart({Key? key}) : super(key: key);

  @override
  State<FLChart> createState() => _FLChartState();
}

class _FLChartState extends State<FLChart> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.90,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              bottom: 12,
            ),
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                log("----------start------>>");
                DateTime currentDate = DateTime.now();
                DateTime startDate =
                    currentDate.subtract(const Duration(days: 90));

                List<TransactionModel> last90DaysTransactions = state
                    .transactionList
                    .where((transaction) =>
                        transaction.date.isAfter(startDate) &&
                        transaction.date.isBefore(currentDate))
                    .toList();

                // Calculate balance for each day within the last 90 days
                List<FlSpot> balanceSpots = [];
                double balance = 0;

                for (int i = 0; i < last90DaysTransactions.length; i++) {
                  TransactionModel transaction = last90DaysTransactions[i];
                  balance += transaction.catagoryType == CatagoryType.expense
                      ? -transaction.amount
                      : transaction.amount;
                  balanceSpots.add(FlSpot(i.toDouble(), balance));
                }

                double maxX = last90DaysTransactions.length.toDouble();

                // Calculate maxY for the y-axis
                double maxY = calculateMaxY(last90DaysTransactions);
                double minY = -maxY * 1.1;

                log("----------end------>>");
                return LineChart(
                  swapAnimationCurve: Curves.bounceIn,
                  swapAnimationDuration: const Duration(seconds: 2),
                  LineChartData(
                    gridData: FlGridData(
                      drawVerticalLine: true,
                      horizontalInterval: 10000, // Adjust based on your data
                      verticalInterval: 2,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: AppColors.contentColorBlue,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: AppColors.contentColorBlue,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 15, // Set the interval to 15 days
                          getTitlesWidget: (value, titleMeta) {
                            int index = value.toInt();
                            if (index >= 0 &&
                                index < last90DaysTransactions.length) {
                              DateTime date =
                                  last90DaysTransactions[index].date;
                              return Text('${date.day}/${date.month}');
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            // interval: 1, // Adjust based on your data
                            getTitlesWidget: leftTitleWidgets,
                            reservedSize: 40
                            //  (value, titleMeta) {
                            //   return Text(
                            //     '\$$value',
                            //     style: const TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 15,
                            //     ),
                            //   );
                            // },
                            // reservedSize: 42,
                            ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: const Color(0xff37434d)),
                    ),
                    minX: 0,
                    maxX: balanceSpots.length.toDouble(),
                    minY: minY,
                    maxY: maxY,
                    lineBarsData: [
                      LineChartBarData(
                        aboveBarData: BarAreaData(),
                        spots: balanceSpots,
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: gradientColors
                                .map((color) => color.withOpacity(0.2))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  double calculateMaxY(List<TransactionModel> transactions) {
    // Implement your logic to calculate maxY based on transactions
    // Example: Find the maximum amount in the transactions
    num maxAmount = transactions.isNotEmpty
        ? transactions
            .map((transaction) => transaction.amount)
            .reduce((a, b) => a > b ? a : b)
        : 0.0;

    return maxAmount * 1.3; // Add some padding for better visualization
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  var style = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case -10000:
      text = '-10K';
      break;
    case 0:
      text = '0';
      break;
    case 10000:
      text = '10K';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
