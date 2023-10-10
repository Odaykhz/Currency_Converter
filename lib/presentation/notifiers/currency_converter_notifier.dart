import 'package:currency_converter/data/models/currency_conversions.dart';
import 'package:currency_converter/domain/api/get_currency_data.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CurrencyConverterNotifier extends ChangeNotifier {
  bool isPressed = false;
  bool isConvert = false;
  String fromCurrency = '';
  String toCurrency = '';
  int amount = 0;
  double toAmount = 0;
  String formattedDate = '';
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map<String, FlagsCode> currencyFlags = {
    'EUR': FlagsCode.EU,
    'USD': FlagsCode.US,
    'JPY': FlagsCode.JP,
    'BGN': FlagsCode.BG,
    'CZK': FlagsCode.CZ,
    'DKK': FlagsCode.DK,
    'GBP': FlagsCode.GB,
    'HUF': FlagsCode.HU,
    'PLN': FlagsCode.PL,
    'RON': FlagsCode.RO,
    'SEK': FlagsCode.SE,
    'CHF': FlagsCode.CH,
    'ISK': FlagsCode.IS,
    'NOK': FlagsCode.NO,
    'HRK': FlagsCode.HR,
    'RUB': FlagsCode.RU,
    'TRY': FlagsCode.TR,
    'AUD': FlagsCode.AU,
    'BRL': FlagsCode.BR,
    'CAD': FlagsCode.CA,
    'CNY': FlagsCode.CN,
    'HKD': FlagsCode.HK,
    'IDR': FlagsCode.ID,
    'ILS': FlagsCode.IL,
    'INR': FlagsCode.IN,
    'KRW': FlagsCode.KR,
    'MXN': FlagsCode.MX,
    'MYR': FlagsCode.MY,
    'NZD': FlagsCode.NZ,
    'PHP': FlagsCode.PH,
    'SGD': FlagsCode.SG,
    'THB': FlagsCode.TH,
    'ZAR': FlagsCode.ZA,
  };

  void setCurrency({required bool isFrom, required String currencyFlag}) {
    if (isFrom) {
      fromCurrency = currencyFlag;
    } else {
      toCurrency = currencyFlag;
    }
    notifyListeners();
  }

  final List<CurrencyConversion> conversionList = [];

  Future<void> convertCurrencyResult() async {
    var box = await Hive.openBox<CurrencyConversion>('conversions_history');
    isPressed = true;
    final currencyData = GetCurrencyData();

    // Check if the conversion already exists in the database
    final existingConversionIndex = box.values.toList().indexWhere(
          (conversion) =>
              conversion.toCurrency == toCurrency &&
              conversion.fromCurrency == fromCurrency &&
              conversion.amount == amount,
        );

    if (existingConversionIndex != -1) {
      // If the conversion already exists in the database, use the existing data
      final existingConversion = box.getAt(existingConversionIndex);
      toAmount = existingConversion!.toAmount;
    } else {
      await currencyData
          .convertCurrencyToBaseCurrency(
        currency: toCurrency,
        baseCurrency: fromCurrency,
      )
          .then((value) {
        final rate = value.data.entries.first.value;
        toAmount = amount * rate;

        // Get the current date in "dd/mm/yyyy" format
        final currentDate = DateTime.now();
        formattedDate =
            "${currentDate.day.toString().padLeft(2, '0')}/${currentDate.month.toString().padLeft(2, '0')}/${currentDate.year}";

        final newConversion = CurrencyConversion(
          toCurrency: toCurrency,
          fromCurrency: fromCurrency,
          amount: amount,
          toAmount: toAmount,
          createdAt: formattedDate,
        );

        conversionList.add(newConversion);
        box.add(newConversion);
      });
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isConvert = true;
    }

    notifyListeners();
  }
}
