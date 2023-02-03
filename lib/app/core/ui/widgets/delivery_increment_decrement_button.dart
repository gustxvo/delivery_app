import 'package:flutter/material.dart';

import '../../../../app/core/ui/styles/colors_app.dart';
import '../../../../app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool _isCompat;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _isCompat = false;

  const DeliveryIncrementDecrementButton.compat({
    super.key,
    required this.amount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _isCompat = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _isCompat ? const EdgeInsets.all(8) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onDecrement,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '-',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: _isCompat ? 10 : 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular.copyWith(
                fontSize: _isCompat ? 13 : 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: onIncrement,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                    fontSize: _isCompat ? 10 : 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
