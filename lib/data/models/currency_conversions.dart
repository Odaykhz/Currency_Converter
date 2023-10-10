import 'package:hive/hive.dart';
part 'currency_conversions.g.dart';

@HiveType(typeId: 0)
class CurrencyConversion extends HiveObject {
  @HiveField(0)
  final String toCurrency;
  @HiveField(1)
  final String fromCurrency;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final double toAmount;
  @HiveField(4)
  final String createdAt;

  CurrencyConversion({
    required this.toCurrency,
    required this.fromCurrency,
    required this.amount,
    required this.toAmount,
    required this.createdAt,
  });
  Map<String, dynamic> toJson() {
    return {
      'toCurrency': toCurrency,
      'fromCurrency': fromCurrency,
      'amount': amount,
      'toAmount': toAmount,
      'createdAt': createdAt,
    };
  }
}
