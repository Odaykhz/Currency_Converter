
import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:currency_converter/presentation/widgets/amount_field.dart';
import 'package:currency_converter/presentation/widgets/convert_button.dart';
import 'package:currency_converter/presentation/widgets/convertion_card.dart';
import 'package:currency_converter/presentation/widgets/from_to_boxes.dart';
import 'package:currency_converter/presentation/widgets/show_history_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final converterNotifier = context.watch<CurrencyConverterNotifier>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Amount Row
              Row(
                children: [
                  Text(
                    'Amount',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.merge(const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 15),
                  AmountTextField(converterNotifier: converterNotifier),
                ],
              ),
              const SizedBox(height: 20),
              // Select Currency
              FromToBoxes(),
              const SizedBox(height: 20),

              ConvertionCard(converterNotifier: converterNotifier),

              const SizedBox(height: 20),
              // Convert Button
              ConvertButton(converterNotifier: converterNotifier),
              const SizedBox(height: 15),
              // show history
              ShowHistoryButton(converterNotifier: converterNotifier),
            ],
          ),
        ),
      ),
    );
  }
}

