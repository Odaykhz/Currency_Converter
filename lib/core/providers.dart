
import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> providersList = [
    ChangeNotifierProvider(
      lazy: false,
      create: (_) {
        return CurrencyConverterNotifier();
      },
    ),
  ];
}
