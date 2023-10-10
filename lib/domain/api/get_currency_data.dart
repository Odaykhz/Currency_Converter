import 'package:currency_converter/core/urls.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/domain/crud.dart';

class GetCurrencyData {
  final CRUD _crud = CRUD();
  Future<Currency> convertCurrencyToBaseCurrency({
    required String currency,
    required String baseCurrency,
  }) async {
    var currencyData = Currency(data: {});
    await _crud
        .read(
      url: '${Urls.baseUrl}&currencies=$currency&base_currency=$baseCurrency',
      action: () {},
    )
        .then((value) {
      currencyData = Currency.fromJson(value.data as Map<String, dynamic>);
    });
    return currencyData;
  }
}
