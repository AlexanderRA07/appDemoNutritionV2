// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayDataAdapter extends TypeAdapter<DayData> {
  @override
  final int typeId = 0;

  @override
  DayData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayData(
      year: fields[0] as int,
      month: fields[1] as int,
      day: fields[2] as int,
      caloriesIn: fields[3] as int,
      caloriesOut: fields[4] as int,
      protein: fields[5] as int,
      carbs: fields[6] as int,
      fat: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DayData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.caloriesIn)
      ..writeByte(4)
      ..write(obj.caloriesOut)
      ..writeByte(5)
      ..write(obj.protein)
      ..writeByte(6)
      ..write(obj.carbs)
      ..writeByte(7)
      ..write(obj.fat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
