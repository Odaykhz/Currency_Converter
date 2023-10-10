import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:currency_converter/presentation/pages/history_page.dart';
import 'package:flutter/material.dart';

class ShowHistoryButton extends StatelessWidget {
  const ShowHistoryButton({
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
              converterNotifier.isConvert = false;
              await Navigator.of(
                context,
              ).push(
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => HistoryPage(),
                ),
              );
            },
            child: const Text('Show History'),
          ),
        ),
      ],
    );
  }
}
