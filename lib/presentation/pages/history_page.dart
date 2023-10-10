import 'package:currency_converter/data/models/currency_conversions.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Box<CurrencyConversion> conversionhistory;
  CurrencyConverterNotifier converterNotifier =
      Provider.of<CurrencyConverterNotifier>(
    navigatorKey.currentContext!,
    listen: true,
  );

  @override
  void initState() {
    super.initState();
    conversionhistory = Hive.box('conversions_history');
    print(conversionhistory.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Consumer<CurrencyConverterNotifier>(
        builder: (context, notifier, child) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: ValueListenableBuilder(
              valueListenable: conversionhistory.listenable(),
              builder: (context, Box<CurrencyConversion> box, _) {
                return ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: conversionhistory.length,
                  itemBuilder: (context, i) {
                    var historyItem = box.getAt(i);
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            historyItem!.createdAt,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      historyItem.amount.toString(),
                                    ),
                                    Text(
                                      historyItem.fromCurrency,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.compare_arrows,
                                size: 35,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.9),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      historyItem.toAmount.toString(),
                                    ),
                                    Text(
                                      historyItem.toCurrency,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
