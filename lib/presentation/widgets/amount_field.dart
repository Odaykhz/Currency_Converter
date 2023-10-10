import 'package:currency_converter/presentation/notifiers/currency_converter_notifier.dart';
import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    required this.converterNotifier,
    super.key,
  });

  final CurrencyConverterNotifier converterNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: converterNotifier.formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please Enter Amount';
            }

            try {
              double.parse(val);
              return null; // Validation passed, it's a valid numeric value
            } catch (e) {
              return 'Enter Numeric Value';
            }
          },
          onTap: () {
            converterNotifier.isConvert = false;
            converterNotifier.isPressed = false;
          },
          onChanged: (val) {
            converterNotifier
              ..isPressed = false
              ..amount = int.parse(val);
          },
          controller: converterNotifier.amountController,
          style: Theme.of(context).textTheme.titleLarge?.merge(
                const TextStyle(fontSize: 18),
              ),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter Amount',
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
