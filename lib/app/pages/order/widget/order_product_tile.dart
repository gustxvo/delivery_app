import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/core/extensions/formatter_extension.dart';
import '../../../../app/core/ui/styles/colors_app.dart';
import '../../../../app/core/ui/styles/text_styles.dart';
import '../../../../app/core/ui/widgets/delivery_increment_decrement_button.dart';
import '../../../../app/dto/order_product_dto.dart';
import '../../../../app/pages/order/order_controller.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: context.textStyles.textRegular.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (product.price * orderProduct.amount).currencyPtBr,
                        style: context.textStyles.textMedium
                            .copyWith(fontSize: 14, color: context.colors.secondary),
                      ),
                      DeliveryIncrementDecrementButton.compat(
                        amount: orderProduct.amount,
                        onIncrement: () {
                          context.read<OrderController>().incrementProduct(index);
                        },
                        onDecrement: () {
                          context.read<OrderController>().decrementProduct(index);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
