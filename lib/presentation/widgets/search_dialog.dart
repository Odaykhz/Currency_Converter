import 'package:currency_converter/main.dart';
import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<dynamic> searchDialog(CurrencyConverterNotifier notifier, bool isFrom) {
  return showModalBottomSheet(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              "Select Currency",
              style: Theme.of(context).textTheme.subtitle1?.merge(
                    TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 15),
            Expanded(
              child: (notifier.currencyFlags.isNotEmpty)
                  ? Consumer<CurrencyConverterNotifier>(
                      builder: (context, notifier, child) {
                        return ListView.builder(
                          itemCount: notifier.currencyFlags.length,
                          itemBuilder: (context, i) {
                            final currencyCode =
                                notifier.currencyFlags.keys.elementAt(i);
                            final flagCode =
                                notifier.currencyFlags[currencyCode];

                            return Card(
                              child: ListTile(
                                onTap: () {
                                  notifier.setCurrency(
                                      currencyFlag: currencyCode,
                                      isFrom: isFrom);
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                                leading: Flag.fromCode(
                                  flagCode!,
                                  width: 20,
                                ),
                                title: Text(
                                  currencyCode,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text("No Currency Found"),
                    ),
            ),
          ],
        ),
      );
    },
  );
}
