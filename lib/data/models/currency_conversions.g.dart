// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_conversions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyConversionAdapter extends TypeAdapter<CurrencyConversion> {
  @override
  final int typeId = 0;

  @override
  CurrencyConversion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyConversion(
      toCurrency: fields[0] as String,
      fromCurrency: fields[1] as String,
      amount: fields[2] as int,
      toAmount: fields[3] as double,
      createdAt: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyConversion obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.toCurrency)
      ..writeByte(1)
      ..write(obj.fromCurrency)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.toAmount)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyConversionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
