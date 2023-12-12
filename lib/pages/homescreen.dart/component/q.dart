// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
// import 'package:money_manager/model/catagory.model/catagory.model.dart';
// import 'package:money_manager/model/transaction.model/transaction.model.dart';
// import 'package:money_manager/utils/appcolors.dart';
// // ... (your existing imports)

// class LineChartSample2 extends StatefulWidget {
//    LineChartSample2({super.key});

//   @override
//   State<LineChartSample2> createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   List<Color> gradientColors = [
//     AppColors.contentColorCyan,
//     AppColors.contentColorBlue,
//   ];

//   bool showAvg = false;

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//      style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '10K';
//         break;
//       case 3:
//         text = '30k';
//         break;
//       case 5:
//         text = '50k';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.left);
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//      style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text =  Text('MAR', style: style);
//         break;
//       case 5:
//         text =  Text('JUN', style: style);
//         break;
//       case 8:
//         text =  Text('SEP', style: style);
//         break;
//       default:
//         text =  Text('', style: style);
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: text,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.20,
//       child: Padding(
//         padding:  EdgeInsets.only(
//           right: 18,
//           left: 12,
//           top: 24,
//         ),
//         child: BlocBuilder<TransactionBloc, TransactionState>(
//           builder: (context, state) {
//             DateTime currentDate = DateTime.now();
//             DateTime startDate = currentDate.subtract( Duration(days: 90));

//             List<TransactionModel> last90DaysTransactions = state
//                 .transactionList!
//                 .where((transaction) =>
//                     transaction.date.isAfter(startDate) &&
//                     transaction.date.isBefore(currentDate))
//                 .toList();

//             // Calculate balance for each day within the last 90 days
//             List<FlSpot> balanceSpots = [];
//             double balance = 0;

//             for (int i = 0; i < last90DaysTransactions.length; i++) {
//               TransactionModel transaction = last90DaysTransactions[i];
//               balance += transaction.catagoryType == CatagoryType.expense
//                   ? -transaction.amount
//                   : transaction.amount;
//               balanceSpots.add(FlSpot(i.toDouble(), balance));
//             }

//             double maxX = last90DaysTransactions.length.toDouble();

//             // Calculate maxY for the y-axis
//             double maxY = calculateMaxY(last90DaysTransactions);
//             double minY = -maxY * 1.1; // Ensure minY is negative for expenses
//             return LineChart(LineChartData(
//               gridData: FlGridData(
//                 show: true,
//                 drawVerticalLine: true,
//                 horizontalInterval: 1,
//                 verticalInterval: 1,
//                 getDrawingHorizontalLine: (value) {
//                   return FlLine(
//                     color:
//                          Color.fromARGB(255, 21, 24, 26).withOpacity(0.2),
//                     strokeWidth: 1,
//                   );
//                 },
//                 getDrawingVerticalLine: (value) {
//                   return FlLine(
//                     color:  Color.fromARGB(26, 16, 50, 28),
//                     strokeWidth: 1,
//                   );
//                 },
//               ),
//               titlesData: FlTitlesData(
//                 show: false,
//                 topTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: false,
//                     reservedSize: 30,
//                     interval: 10, // Adjust interval based on your preference
//                     getTitlesWidget: (value, meta) {
//                       int day = value.toInt() + 1;
//                       return Text('$day');
//                     },
//                   ),
//                 ),
//                 rightTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: false,
//                     interval: maxY == 0
//                         ? 1.0
//                         : maxY / 10, // Ensure a non-zero interval
//                     getTitlesWidget: (value, meta) {
//                       return leftTitleWidgets(
//                           value, meta); // Adjusted to use leftTitleWidgets
//                     },
//                     reservedSize: 42,
//                   ),
//                 ),
//               ),
//               borderData: FlBorderData(
//                 show: false,
//                 border: Border.all(color:  Color(0xff37434d)),
//               ),
//               maxX: maxX,
//               maxY: maxY * 1.6,
//               minY: minY,
//               minX: 0,
//               lineBarsData: [
//                 LineChartBarData(
//                   spots: balanceSpots,
//                   isCurved: true,
//                   // gradient: LinearGradient(
//                   //   colors: gradientColors,
//                   // ),
//                   barWidth: 5,
//                   isStrokeCapRound: true,
//                   dotData: FlDotData(
//                     show: false,
//                   ),
//                   belowBarData: BarAreaData(
//                     show: false,
//                     gradient: LinearGradient(
//                       colors: gradientColors
//                           .map((color) => color.withOpacity(0.3))
//                           .toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ));
//           },
//         ),
//       ),
//     );
//   }

//   double calculateMaxY(List<TransactionModel> transactions) {
//     if (transactions.isEmpty) {
//       return 0;
//     }

//     double maxAmount = transactions
//         .map((transaction) => transaction.amount.abs())
//         .reduce((a, b) => a > b ? a : b)
//         .toDouble();

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/appcolors.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else {
              // log("----------start------>>");
              // DateTime currentDate = DateTime.now();
              // DateTime startDate = currentDate.subtract(const Duration(days: 90));

              // List<TransactionModel> last90DaysTransactions = state
              //     .transactionList!
              //     .where((transaction) =>
              //         transaction.date.isAfter(startDate) &&
              //         transaction.date.isBefore(currentDate))
              //     .toList();

              // // Calculate balance for each day within the last 90 days
              // List<FlSpot> balanceSpots = [];
              // double balance = 0;

              // for (int i = 0; i < last90DaysTransactions.length; i++) {
              //   TransactionModel transaction = last90DaysTransactions[i];
              //   balance += transaction.catagoryType == CatagoryType.expense
              //       ? -transaction.amount
              //       : transaction.amount;
              //   balanceSpots.add(FlSpot(i.toDouble(), balance));
              // }

              // double maxX = last90DaysTransactions.length.toDouble();

              // // Calculate maxY for the y-axis
              // double maxY = calculateMaxY(last90DaysTransactions);
              // double minY = -maxY * 1.1; // Ensure minY is negative for expenses
              // log("----------end------>>");
              return LineChart(LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 5000,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      dashArray: [3, 5],
                      color: const Color.fromARGB(255, 44, 43, 43),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: AppColors.mainGridLineColor,
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
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minX: 0,
                maxX: 11,
                minY: -5000,
                maxY: 10000,

                // minX: 0,
                // maxX: maxX.toDouble(), // Use the actual maximum x-value
                // minY: minY, // Use the calculated minimum y-value
                // maxY: maxY * 1.1, // Use the calculated maximum y-value
                //               minX: 0,

                // maxX: maxX,
                // maxY: maxY * 1,
                //               minY: minY,
                lineBarsData: [
                  LineChartBarData(
                    spots: state.flSpot,
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
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ));
            }
          },
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text(
          'MAR',
        );
        break;
      case 5:
        text = const Text(
          'JUN',
        );
        break;
      case 8:
        text = const Text('SEP');
        break;
      default:
        text = const Text(
          '',
        );
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case -5000:
        text = '-5K';
        break;
      case 0:
        text = '0';
        break;
      case 5000:
        text = '5K';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

double calculateMaxY(List<TransactionModel> transactions) {
  if (transactions.isEmpty) {
    return 0;
  }

  double maxAmount = transactions
      .map((transaction) => transaction.amount.abs())
      .reduce((a, b) => a > b ? a : b)
      .toDouble();

  // Choose a suitable multiplier based on your preference
  double multiplier = 1.1;
  return maxAmount * multiplier;
}
