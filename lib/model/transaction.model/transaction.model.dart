import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';

part 'transaction.model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(1)
  String? id;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CatagoryType catagoryType;
  @HiveField(4)
  final String pupose;

  @HiveField(5)
  final CatagoryModel catagoryModel;

  @HiveField(6)
  final num amount;

  TransactionModel(
      {required this.date,
      required this.amount,
      required this.catagoryType,
      required this.pupose,
      required this.catagoryModel}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
