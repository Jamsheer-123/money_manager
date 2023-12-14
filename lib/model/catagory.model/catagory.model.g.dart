// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catagory.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatagoryModelAdapter extends TypeAdapter<CatagoryModel> {
  @override
  final int typeId = 1;

  @override
  CatagoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatagoryModel(
      images: fields[5] as String,
      categoryField: fields[4] as CategoryField,
      name: fields[1] as String,
      isDeleted: fields[2] as bool,
      id: fields[0] as String,
      catagoryType: fields[3] as CatagoryType,
    );
  }

  @override
  void write(BinaryWriter writer, CatagoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.catagoryType)
      ..writeByte(4)
      ..write(obj.categoryField)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatagoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatagoryTypeAdapter extends TypeAdapter<CatagoryType> {
  @override
  final int typeId = 2;

  @override
  CatagoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return CatagoryType.income;
      case 2:
        return CatagoryType.expense;
      default:
        return CatagoryType.income;
    }
  }

  @override
  void write(BinaryWriter writer, CatagoryType obj) {
    switch (obj) {
      case CatagoryType.income:
        writer.writeByte(1);
        break;
      case CatagoryType.expense:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatagoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryFieldAdapter extends TypeAdapter<CategoryField> {
  @override
  final int typeId = 4;

  @override
  CategoryField read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return CategoryField.fuel;
      case 2:
        return CategoryField.food;
      case 3:
        return CategoryField.travel;
      case 4:
        return CategoryField.grocery;
      case 5:
        return CategoryField.entertainment;
      case 6:
        return CategoryField.others;
      case 7:
        return CategoryField.utility;
      case 8:
        return CategoryField.cloth;
      case 9:
        return CategoryField.salary;
      case 10:
        return CategoryField.loan;
      default:
        return CategoryField.fuel;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryField obj) {
    switch (obj) {
      case CategoryField.fuel:
        writer.writeByte(1);
        break;
      case CategoryField.food:
        writer.writeByte(2);
        break;
      case CategoryField.travel:
        writer.writeByte(3);
        break;
      case CategoryField.grocery:
        writer.writeByte(4);
        break;
      case CategoryField.entertainment:
        writer.writeByte(5);
        break;
      case CategoryField.others:
        writer.writeByte(6);
        break;
      case CategoryField.utility:
        writer.writeByte(7);
        break;
      case CategoryField.cloth:
        writer.writeByte(8);
        break;
      case CategoryField.salary:
        writer.writeByte(9);
        break;
      case CategoryField.loan:
        writer.writeByte(10);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
