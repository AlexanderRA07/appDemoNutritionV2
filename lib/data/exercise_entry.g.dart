// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseEntryAdapter extends TypeAdapter<ExerciseEntry> {
  @override
  final int typeId = 2;

  @override
  ExerciseEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseEntry(
      type: fields[0] as String,
      duration: fields[1] as int,
      intensity: fields[2] as String,
      caloriesBurned: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.intensity)
      ..writeByte(3)
      ..write(obj.caloriesBurned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
