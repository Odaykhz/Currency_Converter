import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:flutter/material.dart';

class ConvertionCard extends StatelessWidget {
  const ConvertionCard({
    super.key,
    required this.converterNotifier,
  });

  final CurrencyConverterNotifier converterNotifier;

  @override
  Widget build(BuildContext context) {
    return converterNotifier.isPressed
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(converterNotifier.formattedDate),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(converterNotifier.amount.toString()),
                          Text(converterNotifier.fromCurrency),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.compare_arrows,
                      size: 35,
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(converterNotifier.toAmount.toString()),
                          Text(converterNotifier.toCurrency),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        : const SizedBox();
  }
}
