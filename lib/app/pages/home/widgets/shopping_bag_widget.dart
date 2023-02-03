import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/core/extensions/formatter_extension.dart';
import '../../../../app/core/ui/helpers/size_extensions.dart';
import '../../../../app/core/ui/styles/text_styles.dart';
import '../../../../app/dto/order_product_dto.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({
    super.key,
    required this.bag,
  });

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('accessToken')) {
      final loginResult = await navigator.pushNamed('/auth/login');

      if (loginResult == null || loginResult == false) {
        return;
      }
    }
    await navigator.pushNamed('/order', arguments: bag);
  }

  @override
  Widget build(BuildContext context) {
    final totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPtBr;

    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.shopping_cart_outlined)),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver sacola',
                style: context.textStyles.textExtraBold,
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalBag,
                  style: context.textStyles.textExtraBold.copyWith(fontSize: 11),
                ))
          ],
        ),
      ),
    );
  }
}
