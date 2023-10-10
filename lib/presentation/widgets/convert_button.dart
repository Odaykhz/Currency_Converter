import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    super.key,
    required this.converterNotifier,
  });

  final CurrencyConverterNotifier converterNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.merge(const TextStyle(fontSize: 18)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              await converterNotifier.convertCurrencyResult();
            },
            child: const Text('Convert'),
          ),
        ),
      ],
    );
  }
}
