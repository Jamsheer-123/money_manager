import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';

abstract class TranScationDBSevice {
  Future<List<TransactionModel>> getTranScation();
  Future<List<TransactionModel>> addTransation(
      TransactionModel transactionModel);
  Future<List<TransactionModel>> deleteTranScation(String transactionid);

  Future<List<FlSpot>> graphList();
}

@LazySingleton(as: TranScationDBSevice)
class TranScation implements TranScationDBSevice {
  List<CatagoryModel> catagoryList = [];
  @override
  Future<List<TransactionModel>> getTranScation() async {
    var transactionDB = await Hive.openBox<TransactionModel>("transaction_db");
    List<TransactionModel> transactions = transactionDB.values.toList();

    // Sort the list by date in descending order (you can change to ascending order if needed)
    transactions.sort((a, b) => a.date.compareTo(b.date));

    return transactions.reversed.toList();
  }

  @override
  Future<List<TransactionModel>> addTransation(
      TransactionModel transactionModel) async {
    try {
      final transactionDB =
          await Hive.openBox<TransactionModel>("transaction_db");
      await transactionDB.put(transactionModel.id, transactionModel);
      catagoryList.clear;

      return transactionDB.values.toList().reversed.toList();
    } catch (e) {
      log(e.toString());
      throw (e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> deleteTranScation(String transactionid) async {
    var transactionDB = await Hive.openBox<TransactionModel>("transaction_db");

    transactionDB.delete(transactionid);
    return transactionDB.values.toList().reversed.toList();
  }

  @override
  Future<List<FlSpot>> graphList() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>("transaction_db");
    log("----------start------>>");
    DateTime currentDate = DateTime.now();
    DateTime startDate = currentDate.subtract(const Duration(days: 90));

    List<TransactionModel> last90DaysTransactions = transactionDB.values
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
      balanceSpots.add(FlSpot(i.toDouble(), balance / 10));
    }

    log("----------end------>>");
    return balanceSpots;
  }
}
