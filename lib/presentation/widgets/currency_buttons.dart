import 'package:currency_converter/main.dart';
import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:currency_converter/presentation/widgets/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget currencySelectButton({
  required bool isFrom,
  required context,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (isFrom) ? "From" : "To",
          style: Theme.of(navigatorKey.currentContext!)
              .textTheme
              .titleMedium
              ?.merge(
                const TextStyle(fontSize: 20),
              ),
        ),
        const SizedBox(height: 5),
        Consumer<CurrencyConverterNotifier>(
          builder: (context, CurrencyConverterNotifier notifier, child) {
            return Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      textStyle: Theme.of(navigatorKey.currentContext!)
                          .textTheme
                          .titleMedium
                          ?.merge(const TextStyle(fontSize: 18)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      notifier.isConvert = false;
                      notifier.isPressed = false;

                      searchDialog(notifier, isFrom);
                    },
                    child: Text(
                      (isFrom)
                          ? (notifier.fromCurrency == "")
                              ? "Currency"
                              : notifier.fromCurrency
                          : (notifier.toCurrency == "")
                              ? "Currency"
                              : notifier.toCurrency,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
