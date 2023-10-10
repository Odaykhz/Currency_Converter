import 'package:currency_converter/presentation/widgets/currency_buttons.dart';
import 'package:flutter/material.dart';

class FromToBoxes extends StatelessWidget {
  const FromToBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        currencySelectButton(
          isFrom: true,
          context: context,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(
              Icons.compare_arrows,
              size: 35,
              color: Theme.of(context).primaryColor.withOpacity(0.9),
            ),
          ),
        ),
        const SizedBox(width: 10),
        currencySelectButton(
          isFrom: false,
          context: context,
        ),
      ],
    );
  }
}

