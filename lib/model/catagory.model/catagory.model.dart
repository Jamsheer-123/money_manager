import 'dart:core';

import 'package:hive/hive.dart';

part 'catagory.model.g.dart';

@HiveType(typeId: 1)
class CatagoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final CatagoryType catagoryType;

  @HiveField(4)
  final CategoryField categoryField;

  @HiveField(5)
  final String images;

  CatagoryModel({
    required this.images,
    required this.categoryField,
    required this.name,
    this.isDeleted = false,
    required this.id,
    required this.catagoryType,
  });
}

@HiveType(typeId: 2)
enum CatagoryType {
  @HiveField(1)
  income,

  @HiveField(2)
  expense,
}

@HiveType(typeId: 4)
enum CategoryField {
  @HiveField(1)
  fuel,

  @HiveField(2)
  food,

  @HiveField(3)
  travel,

  @HiveField(4)
  grocery,

  @HiveField(5)
  entertainment,

  @HiveField(6)
  others,

  @HiveField(7)
  utility,

  @HiveField(8)
  cloth,

  @HiveField(9)
  salary,
  @HiveField(10)
  loan,
}

List<CatagoryModel> initialCategories = [
  CatagoryModel(
    images: fuel,
    categoryField: CategoryField.fuel,
    name: 'Fuel',
    id: '1',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: kfc,
    categoryField: CategoryField.food,
    name: 'KFC',
    id: '2',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: cloth,
    categoryField: CategoryField.cloth,
    name: 'cloth',
    id: '3',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: netflix,
    categoryField: CategoryField.entertainment,
    name: 'Netflix',
    id: '4',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: salary,
    categoryField: CategoryField.salary,
    name: 'Salary',
    id: '5',
    catagoryType: CatagoryType.income,
  ),
  CatagoryModel(
    images: emi,
    categoryField: CategoryField.loan,
    name: 'EMI',
    id: '6',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: starbucks,
    categoryField: CategoryField.food,
    name: 'Star bucks',
    id: '7',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: bus,
    categoryField: CategoryField.travel,
    name: 'Bus',
    id: '8',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: train,
    categoryField: CategoryField.travel,
    name: 'Train',
    id: '9',
    catagoryType: CatagoryType.expense,
  ),
  CatagoryModel(
    images: flight,
    categoryField: CategoryField.travel,
    name: 'Flight',
    id: '109',
    catagoryType: CatagoryType.expense,
  ),

  // Add more categories as needed
];

String amazon = "assets/catagorysvg/amazon-prime-video.svg";
String bus = "assets/catagorysvg/bus.svg";
String cloth = "assets/catagorysvg/cloth.svg";
String electricityBill = "assets/catagorysvg/electricity-bill.svg";
String emi = "assets/catagorysvg/emi-calculator.svg";
String flight = "assets/catagorysvg/flight.svg";
String fuel = "assets/catagorysvg/fuel.svg";
String kfc = "assets/catagorysvg/kfc.svg";
String netflix = "assets/catagorysvg/netflix.svg";
String salary = "assets/catagorysvg/salary-6392.svg";
String starbucks = "assets/catagorysvg/starbucks.svg";
String train = "assets/catagorysvg/train.svg";
